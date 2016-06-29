module XEClient
  class Client

    DEFAULT_URL = "https://xecdapi.xe.com"

    include Virtus.model
    attribute :account_id, String
    attribute :api_key, String
    attribute :url, String, default: DEFAULT_URL

    include ActiveModel::Validations
    validates :account_id, :api_key, presence: true

    def convert_from(base_currency, counter_currencies, amount)
      args = default_args.merge(
        base_currency: base_currency,
        counter_currencies: counter_currencies,
        amount: amount,
      )
      raw_response = ConvertFromRequest.(args)
      ConvertFromResponse.(raw_response)
    end

    private

    def default_args
      attributes.slice(:account_id, :api_key, :url)
    end

  end
end
