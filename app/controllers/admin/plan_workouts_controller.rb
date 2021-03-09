module Admin
  class PlanWorkoutsController < ApplicationController
    before_action :set_plan, only: %i[new create]
    def new
      @plan_workout = PlanWorkout.new
    end

    def create
      @plan_workout = @plan.plan_workouts.build(plan_workout_params)

      respond_to do |format|
        if @plan_workout.save
          format.html { redirect_to admin_plan_path(@plan_workout.plan), success: "Workout added to plan!" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @plan_workout = PlanWorkout.find(params[:id])
      if @plan_workout.destroy
        flash[:success] = "Workout was successfully removed from this plan."
      else
        flash[:error] = "Something went wrong"
      end
      redirect_to admin_plan_path(@plan_workout.plan)
    end

    private

    def set_plan
      @plan = Plan.find(params[:plan_id])
    end

    def plan_workout_params
      params.require(:plan_workout).permit(:workout_id, :plan_id)
    end
  end
end
