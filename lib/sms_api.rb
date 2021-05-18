require 'open-uri'
class SMSApi
  attr_accessor :from_email, :to_email, :sender

  def initialize
    @from_email = Rails.application.secrets.sms_from_email
    @to_email = Rails.application.secrets.sms_to_email
    @sender = Rails.application.secrets.sms_sender
  end

  def sms_deliver(phone, code)
    return stubbed_response unless end_point_available?

    subject = "CUENTA mserra@imi.palma.es PARA #{phone}  REMITENTE #{sender}"
    body = "Clave para verificarte en Tu Fas Palma: #{code}. Ajuntament de Palma"
    ActionMailer::Base.mail(from: from_email, to: to_email, subject: subject, body: body).deliver

    true
  end

  def end_point_available?
    Rails.env.staging? || Rails.env.production? || Rails.env.development?
  end

  def stubbed_response
    {:create_message_response=>{:create_message_result=>{:response_code=>"0", :response_message=>"Operation Success", :id=>"af139a3c-b639-423d-a2e8-8459e3a6ca4c"}}}
  end
end

