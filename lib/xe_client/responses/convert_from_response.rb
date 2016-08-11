module XEClient
  class ConvertFromResponse < BaseResponse

    attribute :from, String, lazy: true, default: :default_from
    attribute :to, Array, lazy: true, default: :default_to

    private

    def default_from
      response_body[:from]
    end

    def default_to
      response_body[:to].map do |quote_hash|
        Quote.new(quote_hash)
      end
    end

  end
end
