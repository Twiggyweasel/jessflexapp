module Admin
  class WorkoutsController < ApplicationController
    layout "admin"
    before_action :set_workout, only: %i[show edit update destroy]

    def index
      @workouts = Workout.all
    end

    def show; end

    def new
      @workout = Workout.new
    end

    def create
      @workout = Workout.new(workout_params)

      respond_to do |format|
        if @workout.save
          format.html { redirect_to admin_workout_path(@workout), success: "Workout successfully created" }
          format.json { render :show, status: :created, location: @workout }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @workout.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit; end

    def update
      respond_to do |format|
        if @workout.update(workout_params)
          format.html { redirect_to admin_workout_path(@workout), success: "Workout successfully updated" }
          format.json { render :show, status: :ok, location: @workout }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @workout.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @workout.destroy
      redirect_to admin_workouts_path
    end

    private

    def set_workout
      @workout = Workout.includes(:activities).find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:title, :description, :bundle_only, :status)
    end
  end
end
