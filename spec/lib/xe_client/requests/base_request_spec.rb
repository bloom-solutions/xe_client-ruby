require 'spec_helper'

module XEClient
  RSpec.describe BaseRequest, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:account_id, String) }
      it { is_expected.to have_attribute(:api_key, String) }
      it { is_expected.to have_attribute(:url, String) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:account_id) }
      it { is_expected.to validate_presence_of(:api_key) }
      it { is_expected.to validate_presence_of(:url) }
    end

  end
end
