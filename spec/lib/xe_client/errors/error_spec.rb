require 'spec_helper'

module XEClient
  RSpec.describe Error do

    describe ".new_from_raw_response" do
      context "there is an error, and error is not mapped" do
        let(:response) { BaseResponse.new(code: 2, message: "My message") }
        let(:error) { described_class.new_from_response(response) }

        it "is a generic error" do
          expect(error).to be_a Error
          expect(error.code).to eq 2
          expect(error.message).to eq "My message"
        end
      end

      context "there is an error, and error is mapped" do
        let(:response) { BaseResponse.new(code: 1, message: "Auth error") }
        let(:error) { described_class.new_from_response(response) }

        it "is a generic error" do
          expect(error).to be_a AuthenticationError
          expect(error.code).to eq 1
          expect(error.message).to eq "Auth error"
        end
      end
    end

  end
end
