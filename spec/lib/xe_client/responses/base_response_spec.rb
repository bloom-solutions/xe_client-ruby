require 'spec_helper'

module XEClient
  RSpec.describe BaseResponse, type: %i[virtus model] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:raw_response) }
      it { is_expected.to have_attribute(:code, Integer) }
      it { is_expected.to have_attribute(:message, String) }
      it { is_expected.to have_attribute(:error) }
    end

    describe ".call" do
      context "there is an error, and error is not mapped" do
        it "raises an error" do
          expect do
            described_class.({code: 2, message: "My message"})
          end.to raise_error(Error, "My message")
        end
      end

      context "there is an error, and error is mapped" do
        it "raises an error" do
          expect do
            described_class.({code: 1, message: "My message"})
          end.to raise_error(AuthenticationError, "My message")
        end
      end
    end

    describe "#code" do
      let(:response) do
        described_class.new(raw_response: {
          "code"=>1,
          "message"=>"Bad credentials",
          "documentation_url"=>"https://xecdapi.xe.com/docs/v1/"
        })
      end
      subject { response.code }

      it { is_expected.to eq 1 }
    end

    describe "#code" do
      let(:response) do
        described_class.new(raw_response: {
          "code"=>1,
          "message"=>"Bad credentials",
          "documentation_url"=>"https://xecdapi.xe.com/docs/v1/"
        })
      end
      subject { response.message }

      it { is_expected.to eq "Bad credentials" }
    end

  end
end
