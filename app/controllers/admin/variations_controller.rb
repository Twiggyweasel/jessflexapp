module Admin
  class VariationsController < ApplicationController
    layout "admin"
    before_action :set_exercise
    before_action :set_variation, only: %i[show edit update destroy]
    def index
      @variations = @exercise.variations

      respond_to do |format|
        format.html { render :index }
        format.json { @variations.to_json }
      end
    end

    def show; end

    def new
      @variation = @exercise.variations.build
    end

    def create
      @variation = @exercise.variations.build(variation_params)
      respond_to do |format|
        if @variation.save
          format.turbo_stream do
            render turbo_stream: turbo_stream.prepend("variations", @variation)
          end
          format.html { redirect_to admin_activity_path(@activity), success: "Variation successfully created" }
          format.json { render :show, status: :created, location: @activity }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace("variation-form",
                                                      partial: "admin/variations/form",
                                                      locals: { activity: @activity, variation: @variation })
          end
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @variation.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit; end

    def update
      respond_to do |format|
        if @variation.update(variation_params)
          format.html { redirect_to admin_activity_path(@exercise), success: "Variation successfully updated" }
          format.json { render :show, status: :ok, location: @exercise }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @variation.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @variation.destroy
      redirect_to admin_activity_path(@exercise)
    end

    private

    def set_exercise
      @exercise = Exercise.find(params[:exercise_id])
    end

    def set_variation
      @variation = Variation.find(params[:id])
    end

    def variation_params
      params.require(:variation).permit(:set, :rep, :weight, :difficulty)
    end
  end
end
