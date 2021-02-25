module Admin
  class VariationsController < ApplicationController
    layout "admin"
    before_action :set_activity, only: %i[new create edit update destroy]
    before_action :set_variation, only: %i[show edit update destroy]

    def show; end

    def new
      @variation = @activity.variations.build
    end

    def create
      @variation = @activity.variations.build(variation_params)
      respond_to do |format|
        if @variation.save
          format.turbo_stream {
            render turbo_stream: turbo_stream.prepend("variations", @variation)
          }
          format.html { redirect_to admin_activity_path(@activity), success: "Variation successfully created" }
          format.json { render :show, status: :created, location: @activity }
        else
          format.turbo_stream {
            render turbo_stream: turbo_stream.replace("variation-form", partial: "admin/variations/form", locals: { activity: @activity, variation: @variation })
          }
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @variation.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit; end

    def update
      respond_to do |format|
        if @variation.update(variation_params)
          format.html { redirect_to admin_activity_path(@activity), success: "Variation successfully updated" }
          format.json { render :show, status: :ok, location: @activity }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @variation.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @variation.destroy
      redirect_to admin_activity_path(@activity)
    end

    private

    def set_activity
      @activity = Activity.find(params[:activity_id])
    end

    def set_variation
      @variation = Variation.find(params[:id])
    end

    def variation_params
      params.require(:variation).permit(:set, :rep, :weight, :difficulty)
    end
  end
end
