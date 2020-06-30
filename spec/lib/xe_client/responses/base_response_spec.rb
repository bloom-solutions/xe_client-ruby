require 'spec_helper'

module XEClient
  RSpec.describe BaseResponse, type: %i[virtus model] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:raw_response) }
      it { is_expected.to have_attribute(:response_body) }
      it { is_expected.to have_attribute(:code, Integer) }
      it { is_expected.to have_attribute(:message, String) }
      it { is_expected.to have_attribute(:error) }
    end

    context "there is an error, and error is not mapped" do
      let(:raw_response) do
        instance_double(Typhoeus::Response, {
          body: {code: 2, message: "My message"}.to_json,
        })
      end
      let(:response) { described_class.new(raw_response: raw_response) }

      it "is not successful" do
        expect(response).to_not be_success
        expect(response.error).to be_a Error
      end
    end

    context "there is an error, and error is mapped" do
      let(:raw_response) do
        instance_double(Typhoeus::Response, {
          body: {code: 1, message: "My message"}.to_json,
        })
      end
      let(:response) { described_class.new(raw_response: raw_response) }

      it "raises an error" do
        expect(response).to_not be_success
        expect(response.error).to be_a AuthenticationError
        expect(response.error.message).to eq "My message"
      end
    end

    describe "#response_body" do
      let(:response) { described_class.new(raw_response: raw_response) }
      let(:raw_response) do
        instance_double(Typhoeus::Response, body: {amount: 1.0}.to_json)
      end

      it "is the raw_response's body in indifferent hash version" do
        expect(response.response_body[:amount]).to eq 1.0
        expect(response.response_body["amount"]).to eq 1.0
      end
    end

    describe "#code" do
      let(:response_body) do
        {
          "code"=>1,
          "message"=>"Bad credentials",
          "documentation_url"=>"https://xecdapi.xe.com/docs/v1/"
        }
      end
      let(:response) do
        described_class.new(response_body: response_body)
      end
      subject { response.code }

      it { is_expected.to eq 1 }
    end

    describe "#code" do
      let(:response_body) do
        {
          "code"=>1,
          "message"=>"Bad credentials",
          "documentation_url"=>"https://xecdapi.xe.com/docs/v1/"
        }
      end
      let(:response) do
        described_class.new(response_body: response_body)
      end
      subject { response.message }

      it { is_expected.to eq "Bad credentials" }
    end

  end
end
