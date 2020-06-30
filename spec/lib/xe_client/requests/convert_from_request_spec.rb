require 'spec_helper'

module XEClient
  RSpec.describe ConvertFromRequest, type: %i[model virtus] do

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:amount, Float) }
    end

  end
end
