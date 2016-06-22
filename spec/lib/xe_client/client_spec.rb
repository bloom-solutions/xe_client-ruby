require 'spec_helper'

module XEClient
  RSpec.describe Client, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:account_id, String) }
      it { is_expected.to have_attribute(:api_key, String) }
      it do
        is_expected.to have_attribute(:url, String).
          with_default(described_class::DEFAULT_URL)
      end
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:account_id) }
      it { is_expected.to validate_presence_of(:api_key) }
    end

  end
end
