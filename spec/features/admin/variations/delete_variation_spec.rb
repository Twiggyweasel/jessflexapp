require "rails_helper"

RSpec.describe "deleting a variation", type: :feature do
  let!(:activity) { create(:activity) }
  let(:variation) { create(:variation, activity: activity) }

  it "will be successful" do
    visit admin_activity_path(activity)
    click_on "Delete"
    expect(page).not_to have_content("1")
  end
end
