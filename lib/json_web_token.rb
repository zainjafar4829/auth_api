class JsonWebToken
  class << self
    SECRET_KEY = Rails.application.secrets.secret_key_base

    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      JWT.decode(token, SECRET_KEY, true)[0]
    rescue JWT::DecodeError
      nil
    end
  end
end