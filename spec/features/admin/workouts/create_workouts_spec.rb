require "rails_helper"

RSpec.describe "create new workout", type: :feature do
  context "with valid attributes" do
    it "will be successful" do
      visit new_admin_workout_path
      fill_in "Title",	with: "Test Title"
      find('trix-editor').click.set("This is the test description")
      fill_in "Duration", with: 60
      # fill_in "Description", with: "This is the test description"
      click_on "Create Workout"
      visit admin_workouts_path
      expect(page).to have_content("Test Title")
    end
  end

  context "with invalid attributes" do
    it "will be display errors" do
      visit new_admin_workout_path
      fill_in "Title", with: ""
      click_on "Create Workout"
      expect(page).to have_content("Title can't be blank")
    end
  end
end
