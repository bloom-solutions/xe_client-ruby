module XEClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)
    attribute :host, String
    attribute :account_id, String
    attribute :api_key, String

    api_action :convert_from
    api_action :historic_rate_period

    private

    def default_opts
      { host: host, account_id: account_id, api_key: api_key }
    end

  end
end
