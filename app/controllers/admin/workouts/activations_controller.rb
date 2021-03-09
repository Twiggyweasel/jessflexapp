module Admin
  module Workouts
    class ActivationsController < ApplicationController
      before_action :set_workout

      def create
        @workout.activate_workout
        redirect_to admin_workout_path(@workout), success: "Workout successfully activated"
      end

      def destroy
        @workout.deactivate_workout
        redirect_to admin_workout_path(@workout), success: "Workout successfully deactivitated"
      end

      private

      def set_workout
        @workout = Workout.find(params[:workout_id])
      end
    end
  end
end
