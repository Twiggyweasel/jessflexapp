module Admin
  class PlansController < ApplicationController
    layout "admin"

    before_action :set_plan, only: %i[show edit update destroy]
    before_action :set_breadcrumbs

    def index
      @plans = Plan.all

      add_breadcrumb("Plans")
    end

    def show
      add_breadcrumb("Plan - #{@plan.id}")
    end

    def new
      @plan = Plan.new

      add_breadcrumb("New Plan")
    end

    def create
      @plan = Plan.new(plan_params)

      respond_to do |format|
        if @plan.save
          format.html { redirect_to [:admin, @plan], success: "Plan successfully created." }
          format.xml { render xml: @plan, status: :created, location: @plan }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.xml { render xml: @plan.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      add_breadcrumb("Plan - #{@plan.id}")
      add_breadcrumb("Edit Plan")
    end

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

    def set_breadcrumbs
      add_breadcrumb("Admin", admin_dashboard_path)
      add_breadcrumb("Plans", admin_plans_path) unless params[:action] == "index"
    end
  end
end
