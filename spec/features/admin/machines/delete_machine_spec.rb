require "rails_helper"

RSpec.describe "delete a machine", type: :feature do
  subject!(:machine) { create(:machine, name: "Deletable Machine") }

  it "will remove machine from machines#index" do
    visit admin_machines_path
    expect(page).to have_text("Deletable Machine")

    click_on "Delete"
    expect(page).not_to have_text("Deletable Machine")
  end
end
