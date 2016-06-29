module XEClient
  class BaseResponse

    include Virtus.model
    attribute :raw_response, IndifferentHash
    attribute :code, Integer, lazy: true, default: :default_code
    attribute :message, String, lazy: true, default: :default_message
    attribute :error, Object, lazy: true, default: :default_error

    def self.call(raw_response)
      response = self.new(raw_response: raw_response)
      raise response.error if response.error.present?
      response
    end

    private

    def default_code
      raw_response[:code]
    end

    def default_message
      raw_response[:message]
    end

    def default_error
      Error.new_from_response(self)
    end

  end
end
