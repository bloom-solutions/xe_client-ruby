require 'spec_helper'

module XEClient
  RSpec.describe BaseRequest, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:host, String) }
      it { is_expected.to have_attribute(:account_id, String) }
      it { is_expected.to have_attribute(:api_key, String) }
    end

  end
end
