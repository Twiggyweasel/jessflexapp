require "rails_helper"

RSpec.describe "editing a Workout", type: :feature do
  subject(:workout) { create(:workout) }

  context "with valid attributes" do
    it "will be successful" do
      visit edit_admin_workout_path(workout)
      fill_in "Title", with: "Changed Title"
      click_on "Update Workout"
      visit admin_workouts_path
      expect(page).to have_content("Changed Title")
    end
  end
end
