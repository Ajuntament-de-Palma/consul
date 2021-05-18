include DocumentParser
class CensusApi

  def call(document_type, document_number)
    response = nil
    get_document_number_variants(document_type, document_number).each do |variant|
      response = Response.new(get_response_body(document_type, variant))
      return response if response.valid?
    end
    response
  end

  class Response
    def initialize(body)
      @body = body
    end

    def valid?
      data.present? && data[:zonaestadistica].present?
    end

    def date_of_birth
      nil
    end

    def postal_code
      nil
    end

    def district_code
      # TODO obtener distrito a partir de la zona via hash
      zone
    end

    def zone
      data[:zonaestadistica][:id]
    end

    def document_number
      data[:credenciales][:idPadronOrIdDocumento][0][:numIdentificador]
    end

    def document_type
      "4"
    end

    def gender
      nil
    end

    def name
      nil
    end

    private

      def data
        @body
      end
  end

  def dni?(document_type)
    document_type.to_s == "1"
  end

  private

    def get_response_body(document_type, document_number)
      if end_point_available?
        perform(new_request, payload(document_type, document_number))
      else
        stubbed_response(document_type, document_number)
      end
    end

    def new_request
      HTTPI::Request.new(
        url: Rails.application.secrets.census_api_end_point,
        headers: {
          "Content-Type" => "application/jose",
          "Accept" => "application/json",
        },
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      )
    end

    def perform(request, payload)
      request.auth.ssl.verify_mode = :none
      request.body = prepare_payload(payload)
      response = HTTPI.post(request)
      puts response.body
      processed_response = process_payload(response.body)
      JSON.parse(processed_response).deep_symbolize_keys
    end

    # preparing request

    def payload(document_type, document_number)
      {
        credenciales: {
          idPadronOrIdDocumento: [
            get_credentials(document_type, document_number),
          ]
        },
        sistemaExterno: {
          id: "CONSUL",
          parametros: []
        }
      }
    end

    def get_credentials(document_type, document_number)
      if is_internal_id?(document_type)
        {
          tipIdentificador: "CON",
          numIdentificador: document_number,
        }
      else
        {
          numDocumento: document_number,
          tipoDocumento: converted_document_type(document_type),
        }
      end
    end

    def is_dni?(document_type)
      document_type.to_s == "1"
    end

    def is_internal_id?(document_type)
      document_type == "4"
    end

    def converted_document_type(document_type)
      case document_type
      when "1"
        "NIF"
      when "2"
        "PT"
      when "3"
        "NIE"
      end
    end

    # stubbed responses
    def stubbed_response(document_type, document_number)
      if document_number == "12345678Z" && document_type == "1"
        stubbed_invalid_response
      else
        #stubbed_valid_response
        {residente_response_basic: {credenciales: {id_padron: {tip_identificador: "CON", num_identificador: "#{rand(1..9999999).to_s.rjust(7, '0')}H"}, id_documento: {num_documento: "E123456789H", tipo_documento: "PT"}}, inscripcion: {distrito: "1", seccion: "1", hoja: "1"}, zonaestadistica: {id: Geozone.all[rand(1..88)], nombre: "Test"}}}
      end
    end

    def stubbed_valid_response
      {
        credenciales: {
          idPadronOrIdDocumento: [
            {
              tipIdentificador: "CON",
              numIdentificador: "GT00096685"
            }
          ]
        },
        inscripcion: {
          distrito: 3,
          seccion: 54,
          hoja: 1639
        },
        zonaestadistica: {
          id: 41,
          nombre: "EL SECAR DE LA REAL"
        }
      }
    end

    def stubbed_invalid_response
      {
        fallo: [
          {
            id: "002",
            mensaje: "El titular del documento no figura como residente o ha sido dado de baja."
          }
        ]
      }
    end

    # encrypting / decrypting

    def prepare_payload(payload)
      signed_payload = sign_payload(payload)
      encrypted_payload = encrypt_payload(signed_payload)
    end

    def process_payload(payload)
      puts payload
      decrypted_payload = decrypt_payload(payload)
      verified_payload = verify_payload(decrypted_payload)
    end

    JOSE_ENCRYPTION_SETTINGS = {
      "alg" => Rails.application.secrets.census_api_enc_key_alg,
      "enc" => Rails.application.secrets.census_api_enc_content_alg,
      "cty" => "json"
    }
    JOSE_SIGNATURE_SETTINGS = { "alg" => Rails.application.secrets.census_api_signature_alg }

    def sign_payload(payload)
      signed_payload = JOSE::JWS.sign(client_key, payload.to_json, JOSE_SIGNATURE_SETTINGS)
      {
        "payload" => signed_payload.to_hash["payload"],
        "signatures" => [
          {
            "protected" => signed_payload.to_hash["protected"],
            "signature" => signed_payload.to_hash["signature"],
          }
        ]
      }
    end

    def encrypt_payload(signed_payload)
      signed_payload_json = signed_payload.to_json
      enc_payload = JOSE::JWE.block_encrypt(server_key, signed_payload_json, JOSE_ENCRYPTION_SETTINGS)
      enc_payload.compact
    end

    def decrypt_payload(encrypted_payload)
      puts encrypted_payload
      decrypted_payload, server_jwe_info = JOSE::JWE.block_decrypt(client_key, encrypted_payload)
      decrypted_hash = JSON.load(decrypted_payload)
      decrypted_compact = JOSE::JWS.compact({
        "payload" =>  decrypted_hash["payload"],
        "signature" => decrypted_hash["signatures"][0]["signature"],
        "protected" =>  decrypted_hash["signatures"][0]["protected"],
      })
    end

    def verify_payload(decrypted_payload)
      verified, return_payload, server_jws_info = JOSE::JWS.verify(server_key, decrypted_payload)
      return_payload
    end

    def end_point_available?
      Rails.env.staging? || Rails.env.production? || Rails.env.development?
    end

    def server_key
      @server_cert ||= OpenSSL::X509::Certificate.new(File.read(Rails.application.secrets.census_api_cert))
      @server_public_key ||= @server_cert.public_key
      @server_key ||= JOSE::JWK.from_key(@server_public_key)
    end

    def client_key
      @client_private_key ||= OpenSSL::PKey::RSA.new(File.read(Rails.application.secrets.census_api_key), Rails.application.secrets.census_api_secret)
      @client_key ||= JOSE::JWK.from_key(@client_private_key)
    end

end
