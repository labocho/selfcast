module TokenAuthenticatable
  module InstanceMethods
    def ensure_authentication_token
      if authentication_token.blank?
        self.authentication_token = generate_authentication_token
      end
    end

    private
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless self.class.where(authentication_token: token).first
      end
    end
  end

  def self.included(klass)
    klass.class_eval do
      include InstanceMethods
      before_save :ensure_authentication_token
    end
  end
end
