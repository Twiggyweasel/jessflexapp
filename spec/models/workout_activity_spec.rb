require "rails_helper"

RSpec.describe WorkoutActivity, type: :model do
  subject(:workout_activity) { create(:workout_activity) }

  context "with valid inputs" do
    it "will be valid" do
      expect(workout_activity).to be_valid
    end
  end
end
