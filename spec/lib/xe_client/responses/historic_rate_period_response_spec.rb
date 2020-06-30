require 'spec_helper'

module XEClient
  RSpec.describe HistoricRatePeriodResponse do

    describe "#to" do
      let(:response) { described_class.new(response_body: raw_body) }

      context "'to' key is not present" do
        let(:raw_body) do
          {
            "terms" => "http://www.xe.com/legal/dfs.php",
            "privacy" => "http://www.xe.com/privacy.php",
            "from" => "PHP",
            "amount" => 1.0,
          }
        end

        it "has an empty `to`" do
          expect(response.to).to be_empty
        end
      end

      context "'to' has values" do
        let(:raw_body) do
          {
            "terms" => "http://www.xe.com/legal/dfs.php",
            "privacy" => "http://www.xe.com/privacy.php",
            "from" => "PHP",
            "amount" => 1.0,
            "to" => {
              "KRW" => [
                {"mid" => 21.3228317122, "timestamp" => "2018-01-01T00:00:00Z"}
              ],
              "USD" => [
                {"mid" => 0.0199976857, "timestamp" => "2018-01-01T00:00:00Z"}
              ]
            }
          }
        end

        it "has contains Quote instances" do
          krw_quote = response.to.select {|q| q.quotecurrency == "KRW"}.sample
          expect(krw_quote.mid).to eq 21.3228317122
          expect(krw_quote.timestamp).to eq "2018-01-01T00:00:00Z".to_datetime

          usd_quote = response.to.select {|q| q.quotecurrency == "USD"}.sample
          expect(usd_quote.mid).to eq 0.0199976857
          expect(usd_quote.timestamp).to eq "2018-01-01T00:00:00Z".to_datetime
        end
      end
    end

  end
end
