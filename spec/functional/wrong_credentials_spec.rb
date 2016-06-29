require 'spec_helper'

module XEClient
  RSpec.describe "Wrong credentials" do

    it "raises an AuthenticationError", vcr: {record: :once} do
      client = XEClient.new(account_id: "asd", api_key: "dsa")
      expect { client.convert_from("USD", %w(IDR), 3.0) }.
        to raise_error(AuthenticationError)
    end

  end
end
