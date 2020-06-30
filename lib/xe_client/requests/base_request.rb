module XEClient
  class BaseRequest

    include APIClientBase::Request.module
    attribute :host, String
    attribute :account_id, String
    attribute :api_key, String

    def typhoeus_options
      { userpwd: [account_id, api_key].join(":") }
    end

  end
end
