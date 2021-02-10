module Admin
  class MachinesController < ApplicationController
    layout "admin"
    before_action :set_machine, only: %i[show edit update destroy]

    def index
      @machines = Machine.all
    end

    def show; end

    def new
      @machine = Machine.new
    end

    def create
      @machine = Machine.new(machine_params)

      if @machine.save
        flash[:success] = "Machine successfully created!"
        redirect_to admin_machine_path(@machine)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @machine.update(machine_params)
        flash[:success] = "Machine successfully updated!"
        redirect_to admin_machine_path(@machine)
      else
        render :edit
      end
    end

    def destroy
      @machine.destroy
      redirect_to admin_machines_path
    end

    private

    def set_machine
      @machine = Machine.find(params[:id])
    end

    def machine_params
      params.require(:machine).permit(:name, :notes)
    end
  end
end
