require 'rails_helper'

RSpec.describe "deleting an activity", type: :feature do
  let!(:activity) { create(:activity) }

  it "will be successful" do
    visit admin_activities_path
    expect(page).to have_content(activity.name)
    click_on "Destroy"
    expect(page).not_to have_content(activity.name) 
  end
end
