require 'spec_helper'

module XEClient
  RSpec.describe "Wrong credentials" do

    it "raises an AuthenticationError", vcr: {record: :once} do
      client = XEClient.new(account_id: "asd", api_key: "dsa")
      response = client.convert_from(from: "USD", to: %w(IDR), amount: 3.0)

      expect(response).to_not be_success
      expect(response.error).to be_a AuthenticationError
    end

  end
end
