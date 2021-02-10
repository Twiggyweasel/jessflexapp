require "rails_helper"

RSpec.describe Plan, type: :model do
  subject(:plan) { create(:plan) }

  describe "Price" do
    context "when provided a number less than 0" do
      it "will be invalid" do
        plan.price = -1
        expect(plan).not_to be_valid
      end
    end

    context "when provided a number greater than 10000" do
      it "will be invalid" do
        plan.price = 100_001
        expect(plan).not_to be_valid
      end
    end
  end
end
