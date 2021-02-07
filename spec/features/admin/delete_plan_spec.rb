require "rails_helper"

RSpec.describe "deleting a plan", type: :feature do
  it "is successful" do
    Plan.create!(title: "Unique Title", description: "This is a testing description", price: 1_000, difficulty: 0,
                 status: 0)
    visit admin_plans_path
    expect(page).to have_content("Unique Title")
    click_on "Destroy"
    expect(page).not_to have_content("Unique Title")
  end
end
