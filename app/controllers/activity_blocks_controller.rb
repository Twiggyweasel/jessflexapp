class ActivityBlocksController < ApplicationController
  before_action :set_activity_block, only: [:show, :edit, :update, :destroy]

  # GET /activity_blocks
  # GET /activity_blocks.json
  def index
    @activity_blocks = ActivityBlock.all
  end

  # GET /activity_blocks/1
  # GET /activity_blocks/1.json
  def show
  end

  # GET /activity_blocks/new
  def new
    @activity_block = ActivityBlock.new
  end

  # GET /activity_blocks/1/edit
  def edit
  end

  # POST /activity_blocks
  # POST /activity_blocks.json
  def create
    @activity_block = ActivityBlock.new(activity_block_params)

    respond_to do |format|
      if @activity_block.save
        format.html { redirect_to @activity_block, notice: 'Activity block was successfully created.' }
        format.json { render :show, status: :created, location: @activity_block }
      else
        format.html { render :new }
        format.json { render json: @activity_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_blocks/1
  # PATCH/PUT /activity_blocks/1.json
  def update
    respond_to do |format|
      if @activity_block.update(activity_block_params)
        format.html { redirect_to @activity_block, notice: 'Activity block was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_block }
      else
        format.html { render :edit }
        format.json { render json: @activity_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_blocks/1
  # DELETE /activity_blocks/1.json
  def destroy
    @activity_block.destroy
    respond_to do |format|
      format.html { redirect_to activity_blocks_url, notice: 'Activity block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_block
      @activity_block = ActivityBlock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_block_params
      params.require(:activity_block).permit(:activity_id, :rep, :set, :weight)
    end
end
