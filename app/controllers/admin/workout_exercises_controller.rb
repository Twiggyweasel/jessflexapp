module Admin
  class WorkoutExercisesController < ApplicationController
    before_action :set_workout, only: %i[new create]

    def show
      @workout_exercise = WorkoutExercise.find(params[:id])
      render json: { html: render_to_string(partial: @workout_exercise) }
      # render json: { html: render_to_string('show'), layout: false }
    end

    def new
      @workout_exercise = WorkoutExercise.new

      render json: {
        html: render_to_string(partial: "form",
                               locals: { workout: @workout, workout_exercise: @workout_exercise }), layout: false
      }
    end

    def create
      @workout_exercise = @workout.workout_activities.build(workout_exercise_params)

      respond_to do |format|
        if @workout_exercise.save
          format.html { redirect_to admin_workout_path(@workout), success: "Exercise successfully added to workout" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @workout_exercise = WorkoutActivity.find(params[:id])
      @workout_exercise.destroy
      redirect_to admin_workout_path(@workout_exercise.workout)
    end

    private

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end

    def workout_exercise_params
      params.require(:workout_exercise).permit(:workout_id, :exercise_id, :series_id, :variation_id, :difficulty)
    end
  end
end
