module XEClient
  class Quote

    include Virtus.model
    attribute :quotecurrency, String
    attribute :mid, Float
    attribute :timestamp, DateTime

  end
end
