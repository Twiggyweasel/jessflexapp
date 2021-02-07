require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user)}

  describe "#full_name" do
    it 'concatenates first and last name' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")  
    end
  end

  describe "#membership_used?" do
    context "with no user_plans" do
      it "returns false" do
        expect(user.membership_used?).to eq(false)
      end
    end
    context "with user_plans" do
      let(:active_user) { create(:user_with_plans)}
      it "returns true" do
        expect(active_user.membership_used?).to eq(true)  
      end
    end
  end
  
end
