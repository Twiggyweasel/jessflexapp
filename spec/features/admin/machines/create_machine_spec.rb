require "rails_helper"

RSpec.describe "Creating a machine", type: :feature do
  before do
    visit new_admin_machine_path
  end

  context "with valid attributes" do
    it "will add machine to machine#index" do
      expect(page).to have_text("Create Machine")
      fill_in "Name",	with: "Machine Name"
      fill_in "Notes", with: "Test notes about this machine"
      click_on "Create Machine"

      visit admin_machines_path
      expect(page).to have_content("Machine Name")
    end
  end

  context "with invalid attributes" do
    it "will display an error" do
      expect(page).to have_text("Create Machine")
      fill_in "Name", with: ""
      click_on "Create Machine"

      expect(page).to have_content("Name can't be blank")
    end
  end
end
