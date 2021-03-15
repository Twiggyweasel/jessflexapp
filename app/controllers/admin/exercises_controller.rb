module Admin
  class ExercisesController < ApplicationController
    layout "admin"
    before_action :set_exercise, only: %i[show edit update destroy]
    before_action :set_breadcrumbs

    # GET /exercises
    # GET /exercises.json
    def index
      @pagy, @exercises = pagy(Exercise.includes(:variations).all, max_items: 5)

      add_breadcrumb("Exercises")
    end

    # GET /exercises/1
    # GET /exercises/1.json
    def show 
      add_breadcrumb("Exercise")
    end

    # GET /exercises/new
    def new
      @exercise = Exercise.new
      add_breadcrumb("New Exercise")
    end

    # GET /exercises/1/edit
    def edit
      add_breadcrumb("Exercise", [:admin, @exercise])
      add_breadcrumb("Edit Exercise")
    end

    # POST /exercises
    # POST /exercises.json
    def create
      @exercise = Exercise.new(exercise_parmas)

      respond_to do |format|
        if @exercise.save
          format.html { redirect_to [:admin, @exercise], success: "exercise was successfully created." }
          format.json { render :show, status: :created, location: @exercise }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @exercise.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /exercises/1
    # PATCH/PUT /exercises/1.json
    def update
      respond_to do |format|
        if @exercise.update(exercise_parmas)
          format.html { redirect_to [:admin, @exercise], success: "Exercise was successfully updated." }
          format.json { render :show, status: :ok, location: @exercise }
        else
          format.html { render :edit }
          format.json { render json: @exercise.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /exercises/1
    # DELETE /exercises/1.json
    def destroy
      @exercise.destroy
      respond_to do |format|
        format.html { redirect_to admin_activities_url, notice: "Exercise was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.includes(:variations).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_parmas
      params.require(:exercise).permit(:name, :simple_desc, :detail_desc, :location, :category, :set_label,
                                       :has_weight, :machine_based)
    end

    def set_breadcrumbs
      add_breadcrumb("Admin", admin_dashboard_path)
      add_breadcrumb("Exercises", admin_exercises_path) unless params[:action] == "index"
    end
  end
end
