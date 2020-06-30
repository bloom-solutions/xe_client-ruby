module XEClient
  class HistoricRatePeriodResponse < BaseResponse

    attribute :from, String, lazy: true, default: :default_from
    attribute :to, Array, lazy: true, default: :default_to

    private

    def default_from
      response_body[:from]
    end

    def default_to
      response_body[:to].each_with_object([]) do |(currency, quote_args), arr|
        quote_args.each do |quote_arg|
          arr << Quote.new(quote_arg.merge(quotecurrency: currency))
        end
      end
    end

  end
end
