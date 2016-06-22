module XEClient
  class ConvertFromResponse < BaseResponse

    attribute :from, String, lazy: true, default: :default_from
    attribute :to, Array, lazy: true, default: :default_to
    attribute :raw_response, IndifferentHash

    private

    def default_from
      raw_response[:from]
    end

    def default_to
      raw_response[:to].map do |quote_hash|
        Quote.new(quote_hash)
      end
    end

  end
end
