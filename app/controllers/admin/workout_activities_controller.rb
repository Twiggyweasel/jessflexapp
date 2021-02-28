module Admin
  class WorkoutActivitiesController < ApplicationController
    before_action :set_workout, only: %i[new create]
    def new
      @workout_activity = WorkoutActivity.new
    end

    def create
      @workout_activity = @workout.workout_activities.build(workout_activity_params)

      respond_to do |format|
        if @workout_activity.save
          format.html { redirect_to admin_workout_path(@workout), success: "Activity successfully added to workout" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @workout_activity = WorkoutActivity.find(params[:id])
      @workout_activity.destory
      redirect_to admin_workout_path(@workout_activity.workout)
    end
  
    private

      def set_workout
        @workout = Workout.find(params[:workout_id])
      end

      def workout_activity_params
        params.require(:workout_activity).permit(:workout_id, :variation_id)
      end
  end
end
