require "rails_helper"

RSpec.describe Workout, type: :model do
  describe "#activatable?" do
    context "when no workout_activities exist" do
      subject(:workout) { create(:workout) }

      it "returns false" do
        expect(workout.activatable?).to be(false)
      end
    end

    context "when atleast 1 workout_activity exists" do
      subject(:workout) { create(:workout_with_activities) }

      it "returns true" do
        expect(workout.activatable?).to be(true)
      end
    end
  end

  describe "#activation_needed?" do
    context "when activatable && inactive" do
      subject(:workout) { create(:workout_with_activities) }

      it "returns true" do
        expect(workout.activation_needed?).to be(true)
      end
    end

    context "when not activatable" do
      subject(:workout) { create(:workout) }

      it "returns false" do
        expect(workout.activation_needed?).to be(false)
      end
    end

    context "when active" do
      subject(:workout) { create(:workout_with_activities) }

      it "returns false" do
        workout.status = "active"
        expect(workout.activation_needed?).to be(false)
      end
    end
  end

  describe "#check_activation" do
    context "with inactive" do
      subject(:workout) { create(:workout) }

      it "returns true" do
        expect(workout.check_activation).to be(true)
      end
    end

    context "with workout_activities" do
      subject(:workout) { create(:workout_with_activities) }

      it "returns true" do
        expect(workout.check_activation).to be(true)
      end
    end

    context "without workout_activities" do
      subject(:workout) { create(:workout) }

      it "changes status to inactive" do
        workout.status = "active"
        workout.check_activation
        expect(workout.status).to eq("inactive")
      end
    end
  end

  describe "#activate_workout" do
    context "when active" do
      subject(:workout) { create(:workout) }

      it "returns true" do
        workout.status = "active"
        expect(workout.activate_workout).to be(true)
      end
    end

    context "when inactive but not activatable" do
      subject(:workout) { create(:workout) }

      it "raises error" do
        workout.status = "inactive"
        expect { workout.activate_workout }.to raise_error(StandardError)
      end
    end

    context "when inactive and activatable" do
      subject(:workout) { create(:workout_with_activities) }

      it "updates workout.status to active" do
        workout.status = "inactive"
        workout.activate_workout
        expect(workout.status).to eq("active")
      end
    end
  end

  describe "#deacativate_workout" do
    context "when inactive" do
      subject(:workout) { create(:workout) }

      it "returns true" do
        expect(workout.deactivate_workout).to be(true)
      end
    end

    context "when active" do
      subject(:workout) { create(:workout) }

      it "updates status to inactive" do
        workout.status = "active"
        workout.deactivate_workout
        expect(workout.status).to eq("inactive")
      end
    end
  end

  describe "#duration_in_minutes" do
    context "when passed a valid number" do
      subject(:workout) { create(:workout, duration: 120) }

      it "returns number of minutes" do
        expect(workout.duration_in_minutes).to eq(2)
      end
    end
  end
end
