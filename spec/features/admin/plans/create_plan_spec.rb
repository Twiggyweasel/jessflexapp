require "rails_helper"

RSpec.describe "Creating a plan", type: :feature do
  it "valid inputs" do
    visit new_admin_plan_path
    expect(page).to have_text("Plan")
    fill_in "Title", with: "Fake Plan"
    fill_in "Description", with: "This is a fake decription"
    fill_in "Price", with: 1_000
    select("Beginner", from: "Difficulty")
    select("Hidden", from: "Status")
    click_on "Create Plan"
    visit admin_plans_path
    expect(page).to have_content("Fake Plan")
  end

  it "invalid inputs" do
    visit new_admin_plan_path
    fill_in "Title", with: ""
    click_on "Create Plan"
    expect(page).to have_content("Title can't be blank")
  end
end
