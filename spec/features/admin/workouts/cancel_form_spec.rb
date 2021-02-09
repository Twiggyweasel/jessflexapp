require "rails_helper"

RSpec.describe "canceling out of workout form", type: :feature do
  context "when creating a new record" do
    it "will show admin_workout_path" do
      visit new_admin_workout_path
      click_on "Cancel"
      expect(page).to have_content("All Workouts")
    end
  end

  context "when editing an existing record" do
    subject(:workout) { create(:workout) }

    it "will show admin_workout_path(workout)" do
      visit edit_admin_workout_path(workout)
      click_on "Cancel"
      expect(page).to have_content(workout.title)
    end
  end
end
