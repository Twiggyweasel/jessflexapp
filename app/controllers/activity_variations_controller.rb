class ActivityVariationsController < ApplicationController
  before_action :set_activity_variation, only: %i[show edit update destroy]

  # GET /activity_variations
  # GET /activity_variations.json
  def index
    @activity_variations = ActivityVariation.all
  end

  # GET /activity_variations/1
  # GET /activity_variations/1.json
  def show; end

  # GET /activity_variations/new
  def new
    @activity_variation = ActivityVariation.new
  end

  # GET /activity_variations/1/edit
  def edit; end

  # POST /activity_variations
  # POST /activity_variations.json
  def create
    @activity_variation = ActivityVariation.new(activity_variation_params)

    respond_to do |format|
      if @activity_variation.save
        format.html { redirect_to @activity_variation, notice: "Activity variation was successfully created." }
        format.json { render :show, status: :created, location: @activity_variation }
      else
        format.html { render :new }
        format.json { render json: @activity_variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_variations/1
  # PATCH/PUT /activity_variations/1.json
  def update
    respond_to do |format|
      if @activity_variation.update(activity_variation_params)
        format.html { redirect_to @activity_variation, notice: "Activity variation was successfully updated." }
        format.json { render :show, status: :ok, location: @activity_variation }
      else
        format.html { render :edit }
        format.json { render json: @activity_variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_variations/1
  # DELETE /activity_variations/1.json
  def destroy
    @activity_variation.destroy
    respond_to do |format|
      format.html { redirect_to activity_variations_url, notice: "Activity variation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity_variation
    @activity_variation = ActivityVariation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_variation_params
    params.require(:activity_variation).permit(:difficulty, :weight, :set, :rep, :activity_id)
  end
end
