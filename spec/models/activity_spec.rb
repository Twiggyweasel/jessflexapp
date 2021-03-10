require "rails_helper"

RSpec.describe Activity, type: :model do
  subject(:activity) { create(:activity) }

  context "with valid inputs" do
    it "will be valid" do
      expect(activity).to be_valid
    end
  end
end
