require_dependency Rails.root.join('app', 'models', 'concerns', 'verification').to_s

module Verification
  extend ActiveSupport::Concern

  def verification_sms_sent?
    return true
  end

  def sms_verified?
    return true
  end
end
