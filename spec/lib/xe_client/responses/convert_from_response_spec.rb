require 'spec_helper'

module XEClient
  RSpec.describe ConvertFromResponse, type: %i[virtus model] do

    it "inherits from BaseResponse" do
      expect(described_class < BaseResponse).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:from, String) }
      it { is_expected.to have_attribute(:to, Array) }
    end

    describe "#from" do
      let(:response_body) { {"from"=>"USD"} }
      let(:response) { described_class.new(response_body: response_body) }

      it "defaults to the from in the response_body" do
        expect(response.from).to eq "USD"
      end
    end

    describe "#to" do
      let(:response) { described_class.new(response_body: response_body) }
      let(:quotes) { response.to }

      context "there is a 'to' key" do
        let(:response_body) do
          {
            "to"=>[
              { "quotecurrency"=>"PHP", "mid"=>9362.4303823831 },
              { "quotecurrency"=>"KRW", "mid"=>233154.1943469963 }
            ]
          }
        end

        it "defaults to Quote instances per quote" do
          expect(quotes.count).to eq 2
          expect(quotes.first).to be_a Quote
          expect(quotes.first.quotecurrency).to eq "PHP"
          expect(quotes.last.mid).to eq 233154.1943469963
        end
      end
    end

  end
end
