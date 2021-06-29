require_dependency Rails.root.join("app", "models", "verification", "residence").to_s

class Verification::Residence
  validate :local_postal_code
  validate :local_residence

  def save
    return false unless valid?

    user.take_votes_if_erased_document(document_number, document_type)

    user.update(document_number:       document_number,
                document_type:         document_type,
                geozone:               geozone,
                date_of_birth:         date_of_birth.in_time_zone.to_datetime,
                gender:                gender,
                residence_verified_at: Time.current,
                verified_at:           Time.current)
  end


  def local_postal_code
    errors.add(:postal_code, I18n.t("verification.residence.new.error_not_allowed_postal_code")) unless valid_postal_code?
  end

  def local_residence
    return if errors.any?

    unless residency_valid?
      errors.add(:local_residence, false)
      store_failed_attempt
      Lock.increase_tries(user)
    end
  end

  private

    def valid_postal_code?
      postal_code =~ /^07/
    end

    def residency_valid?
      @census_data.valid?
    end
end
