require "rails_helper"

RSpec.describe "creating an activity", type: :feature do
  context "with valid inputs" do
    it "will be successful" do
      name = Faker::Lorem.characters(number: 10)
      visit new_admin_activity_path
      fill_in "Name",	with: name
      fill_in "Simple desc",	with: Faker::Lorem.paragraph(sentence_count: 2)
      fill_in "Detail desc", with: Faker::Lorem.paragraph(sentence_count: 10)
      select(Activity.locations.keys[0].titleize, from: "Location")
      select(Activity.categories.keys[0].titleize, from: "Category")
      select(Activity.set_labels.keys[0].titleize, from: "Set label")
      click_on "Create Activity"
      visit admin_activities_path
      expect(page).to have_content(name)
    end
  end

  context "with invalid inputs" do
    it "will be unsuccessful" do
      visit new_admin_activity_path
      fill_in "Name",	with: ""
      fill_in "Simple desc",	with: Faker::Lorem.paragraph(sentence_count: 2)
      fill_in "Detail desc", with: Faker::Lorem.paragraph(sentence_count: 10)
      select(Activity.locations.keys[0].titleize, from: "Location")
      select(Activity.categories.keys[0].titleize, from: "Category")
      select(Activity.set_labels.keys[0].titleize, from: "Set label")
      click_on "Create Activity"
      expect(page).to have_content("Name can't be blank")
    end
  end
end
