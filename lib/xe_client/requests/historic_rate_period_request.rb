module XEClient
  class HistoricRatePeriodRequest < BaseRequest

    attribute :from, String
    attribute :to, Array[String]
    attribute :start_timestamp, DateTime
    attribute :end_timestamp, DateTime
    attribute :interval, String
    attribute :per_page, Integer
    attribute :page, Integer

    def path
      "/v1/historic_rate/period.json"
    end

    def params
      {
        from: from,
        to: to.join(","),
        start_timestamp: start_timestamp,
        end_timestamp: end_timestamp,
        interval: interval,
        per_page: per_page,
        page: page,
      }
    end

  end
end
