require "rails_helper"

RSpec.describe "deleting a variation", type: :feature do
  let!(:activity) { create(:activity) }

  it "will be successful" do
    activity.variations.create(set: 1, rep: 1, difficulty: 1)

    visit admin_activity_path(activity)
    click_on "Delete"
    expect(page).not_to have_content("1")
  end
end
