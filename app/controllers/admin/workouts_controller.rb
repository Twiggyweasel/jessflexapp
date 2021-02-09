class Admin::WorkoutsController < ApplicationController
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

    if @workout.save
      flash[:success] = "Workout successfully created"
      redirect_to admin_workout_path(@workout)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @workout.update(workout_params)
      flash[:success] = "Workout successfully updated"
      redirect_to admin_workout_path(@workout)
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to admin_workouts_path
  end

  private 

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :description, :bundle_only, :status)
  end
end
