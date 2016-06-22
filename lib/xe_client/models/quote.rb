module XEClient
  class Quote

    include Virtus.model
    attribute :quotecurrency, String
    attribute :mid, Float

  end
end
