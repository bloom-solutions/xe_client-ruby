require 'spec_helper'

RSpec.describe "#historic_rate_period", vcr: {record: :once} do

  it "fetches historic rates" do
    client = XEClient.new(CONFIG.slice(:account_id, :api_key))
    start_at = "2018-01-01".to_datetime.beginning_of_day
    end_at = "2018-12-01".to_datetime.end_of_day

    response = client.historic_rate_period({
      from: "PHP",
      to: %w(USD KRW),
      start_timestamp: start_at,
      end_timestamp: end_at,
      interval: "daily",
      per_page: 100,
      page: 1,
    })

    expect(response.from).to eq "PHP"
    expect(response.to).to be_any

    krw_quote = response.to.select {|quote| quote.quotecurrency == "KRW"}.sample
    expect(krw_quote.mid).to be > 0
    expect(krw_quote.timestamp).to be_present
  end

end
