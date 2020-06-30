require 'spec_helper'

RSpec.describe "#convert_from", vcr: {record: :once} do

  it "converts from one currency to one or more currencies" do
    client = XEClient.new(CONFIG.slice(:account_id, :api_key))
    response = client.convert_from(from: "USD", to: %w(PHP KRW), amount: 201.52)

    expect(response.from).to eq "USD"
    quotes = response.to
    expect(quotes.count).to eq 2

    php = quotes.find {|q| q.quotecurrency == "PHP"}
    expect(php.mid).to be > 0

    krw = quotes.find {|q| q.quotecurrency == "KRW"}
    expect(krw.mid).to be > 0
  end

end
