module Admin
  class VariationsController < ApplicationController
    before_action :set_activity, only: %i[new create edit update destroy]
    before_action :set_variation, only: %i[show edit update destroy]
    
    def show; end

    def new
      @variation = @activity.variations.build
    end

    def create
      @variation = @activity.variations.build(variation_params)

      if @variation.save
        flash[:success] = "Variation successfully created"
        redirect_to admin_activity_path(@activity)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @variation.update(variation_params)
        flash[:success] = "Variation successfully updated"
        redirect_to admin_activity_path(@activity)
      else
        render :edit
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