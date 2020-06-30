require "spec_helper"

module XEClient
  RSpec.describe Quote, type: %i[virtus model] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:quotecurrency, String) }
      it { is_expected.to have_attribute(:mid, Float) }
      it { is_expected.to have_attribute(:timestamp, DateTime) }
    end

  end
end
