require 'spec_helper'

module XEClient
  RSpec.describe ConvertFromRequest, type: %i[model virtus] do

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:base_currency, String) }
      it { is_expected.to have_attribute(:counter_currencies, Array[String]) }
      it { is_expected.to have_attribute(:amount, Float) }
      it { is_expected.to have_attribute(:endpoint, String) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:base_currency) }
      it { is_expected.to validate_presence_of(:counter_currencies) }
      it { is_expected.to validate_presence_of(:amount) }
    end

    describe "#endpoint" do
      let(:request) { described_class.new(url: "http://hello.com") }
      subject { request.endpoint }
      it { is_expected.to eq "http://hello.com/v1/convert_from.json" }
    end

  end
end
