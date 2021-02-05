require 'rails_helper'

RSpec.describe Plan, type: :model do
  subject(:plan) { Plan.create }

  describe "Price" do
    context "when provided a number less than 0" do
      it "will be invalid" do
        subject.price = -1
        expect(subject).to_not be_valid
      end
    end

    context "when provided a number greater than 10000" do
      it "will be invalid" do
        subject.price = 10001
        expect(subject).to_not be_valid
      end
    end
  end
  
end
