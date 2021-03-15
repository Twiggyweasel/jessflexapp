require "rails_helper"

RSpec.describe "Breadcrumb", type: :model do
  describe "#link?" do
    context "without a path" do
      it "will return false" do
        breadcrumb = Breadcrumb.new("Test", nil)
        expect(breadcrumb.link?).to eq(false)
      end
    end

    context "with a path" do
      it "will return true" do
        breadcrumb = Breadcrumb.new("Test", "/admin/dashboard")
        expect(breadcrumb.link?).to eq(true)
      end
    end
  end
end
