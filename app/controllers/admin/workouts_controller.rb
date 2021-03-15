module Admin
  class WorkoutsController < ApplicationController
    layout "admin"
    before_action :set_workout, only: %i[show edit update destroy]
    before_action :set_breadcrumbs

    def index
      @workouts = Workout.all

      add_breadcrumb("Workouts")
    end

    def show 
      add_breadcrumb("Workout - #{@workout.id}")
    end

    def new
      @workout = Workout.new
      add_breadcrumb("New Workout")
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

    def edit
      add_breadcrumb("Workout - #{@workout.id}", admin_workout_path(@workout))
      add_breadcrumb("Edit Workout")
    end

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
      @workout = Workout.includes(:exercises).find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:title, :description, :bundle_only, :status)
    end

    def set_breadcrumbs
      add_breadcrumb("Admin", admin_dashboard_path)
      add_breadcrumb("Workouts", admin_workouts_path) unless params[:action] == "index"
    end
  end
end
