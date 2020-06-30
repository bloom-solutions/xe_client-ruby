module XEClient
  class BaseResponse

    include APIClientBase::Response.module
    attribute :raw_response
    attribute(:response_body, IndifferentHash, {
      lazy: true,
      default: :default_response_body,
    })
    attribute :code, Integer, lazy: true, default: :default_code
    attribute :message, String, lazy: true, default: :default_message
    attribute :error, Object, lazy: true, default: :default_error

    private

    def default_code
      response_body[:code]
    end

    def default_message
      response_body[:message]
    end

    def default_error
      Error.new_from_response(self)
    end

    def default_response_body
      JSON.parse(raw_response.body)
    end

    def default_success
      error.blank?
    end

  end
end
