require "rails_helper"

RSpec.describe "Updating a plan", type: :feature do
  it "with valid inputs" do
    plan = Plan.create!(title: "Unique Title", description: "This is a testing description", price: 1_000,
                        difficulty: 0, status: 0)
    visit edit_admin_plan_path(id: plan.id)
    fill_in "Title", with: "Different Title"
    click_on "Update Plan"
    visit admin_plans_path
    expect(page).to have_content("Different Title")
  end
end
