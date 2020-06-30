module XEClient
  class ConvertFromRequest < BaseRequest

    attribute :from, String
    attribute :to, Array[String]
    attribute :amount, Float

    def path
      "/v1/convert_from.json"
    end

    def params
      {
        from: from,
        to: to.join(","),
        amount: amount,
      }
    end

  end
end
