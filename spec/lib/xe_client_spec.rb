require 'spec_helper'

describe XEClient do

  it 'has a version number' do
    expect(XEClient::VERSION).not_to be nil
  end

  describe ".new" do
    context "validations passed" do
      let(:client) { described_class.new(CONFIG.slice(:account_id, :api_key)) }

      it "creates a new XEClient::Client" do
        expect(client).to be_a XEClient::Client
        expect(client.account_id).to eq CONFIG[:account_id]
        expect(client.api_key).to eq CONFIG[:api_key]
      end
    end
  end

end
