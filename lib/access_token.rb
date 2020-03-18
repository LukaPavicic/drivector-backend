class AccessToken
  class << self
    def encode(payload)
      p payload
      exp = 1.day.from_now
      payload[:exp] = exp.to_i
      key = Rails.application.secrets.secret_key_base
      JWT.encode(payload, key)
    end

    def decode(token)
      key = Rails.application.secrets.secret_key_base
      JWT.decode(token, key)
    end

    def get_user_from_token(token)
      begin
        response = self.decode(token)
      rescue JWT::VerificationError
        return nil
      end
      payload = response[0]
      user_id = payload['user_id']
      User.find_by(id: user_id)
    end
  end
end
