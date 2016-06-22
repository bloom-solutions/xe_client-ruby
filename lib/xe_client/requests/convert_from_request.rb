module XEClient
  class ConvertFromRequest < BaseRequest

    DEFAULT_PATH = "/v1/convert_from.json"
    attribute :base_currency, String
    attribute :counter_currencies, Array[String]
    attribute :amount, Float
    attribute :endpoint, String, lazy: true, default: :default_endpoint

    validates(
      :base_currency,
      :counter_currencies,
      :amount,
      presence: true,
    )

    def call
      HTTParty.get(
        endpoint,
        query: {
          from: base_currency,
          to: counter_currencies.join(","),
          amount: amount,
        },
        basic_auth: { username: account_id, password: api_key },
      )
    end

    private

    def default_endpoint
      uri = URI.parse(url)
      uri.path = DEFAULT_PATH
      uri.to_s
    end

  end
end
