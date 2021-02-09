require "rails_helper"

RSpec.describe "creating a variation", type: :feature do
  subject(:activity) { create(:activity) }

  context "with valid attributes" do
    it "will be successful" do
      visit new_admin_activity_variation_path(activity)
      fill_in "Set", with: 3
      fill_in "Rep", with: 10
      select(Variation.difficulties.keys[0].titleize, from: "Difficulty")
      click_on "Create Variation"
      visit admin_activity_path(activity)
      expect(page).to have_content("10")
    end
  end

  context "with invalid attributes" do
    it "will be unsucessful" do
      visit new_admin_activity_variation_path(activity)
      fill_in "Rep", with: 10
      select(Variation.difficulties.keys[0].titleize, from: "Difficulty")
      click_on "Create Variation"
      expect(page).to have_content("Set can't be blank")
    end
  end
end
