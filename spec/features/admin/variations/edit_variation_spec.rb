require 'rails_helper'

RSpec.describe "editing a variation" do
  let(:activity) { create(:activity) }
  let(:variation) { create(:variation, activity: activity)}
  context "with valid attributes" do
    it "will be successful" do
      visit edit_admin_activity_variation_path(activity, variation)
      fill_in "Rep",	with: 50
      click_on "Update Variation"
      visit admin_activity_path(activity)
      expect(page).to have_content('50') 
    end
  end
end

