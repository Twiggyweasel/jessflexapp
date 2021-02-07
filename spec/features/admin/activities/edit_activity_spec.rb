require "rails_helper"

RSpec.describe "editing an activity", type: :feature do
  let!(:activity) { create(:activity) }

  context "with valid inputs" do
    it "will be successful" do
      visit edit_admin_activity_path(activity.id)
      fill_in "Name",	with: "sometext"
      click_on "Update Activity"
      visit admin_activities_path
      expect(page).to have_content("sometext")
    end
  end
end
