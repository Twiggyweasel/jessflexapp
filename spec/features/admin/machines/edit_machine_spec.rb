require "rails_helper"

RSpec.describe "Editing a machine", type: :feature do
  context "with valid attributes" do
    subject(:machine) { create(:machine) }

    it "will update attribute on machine#index" do
      visit edit_admin_machine_path(machine)
      expect(page).to have_text("Update Machine")

      fill_in "Name", with: "Updated Name"
      click_on "Update Machine"
      visit admin_machines_path
      expect(page).to have_content("Updated Name")
    end
  end
end
