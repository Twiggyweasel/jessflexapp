module Admin
  class PlansController < ApplicationController
    layout "admin"
    before_action :set_plan, only: %i[show edit update destroy]

    def index
      @plans = Plan.all
    end

    def show; end

    def new
      @plan = Plan.new
    end

    def create
      @plan = Plan.new(plan_params)

      respond_to do |format|
        if @plan.save
          flash[:notice] = "plan was successfully created."
          format.html { redirect_to([:admin, @plan]) }
          format.xml { render xml: @plan, status: :created, location: @plan }
        else
          format.html { render :new }
          format.xml { render xml: @plan.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit; end

    def update
      if @plan.update(plan_params)
        flash[:success] = "Object was successfully updated"
        redirect_to [:admin, @plan]
      else
        render :edit
      end
    end

    def destroy
      if @plan.destroy
        flash[:success] = "Plan was successfully deleted."
      else
        flash[:error] = "Something went wrong"
      end
      redirect_to admin_plans_url
    end

    private

    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:title, :description, :status, :price, :difficulty)
    end
  end
end
