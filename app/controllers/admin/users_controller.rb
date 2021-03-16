module Admin
  class UsersController < ApplicationController
    layout "admin"
    before_action :set_user, only: %i[show edit update destroy]
    before_action :set_breadcrumbs

    def index
      @users = User.all
    end

    def show
      add_breadcrumb("User - #{@user.id}")
    end

    def new
      @user = User.new

      add_breadcrumb("New User")
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path, success: "User successfully created"
      else
        render :new
      end
    end

    def edit
      add_breadcrumb("User - #{@user.id}")
      add_breadcrumb("Edit User")
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, success: "User successfully updated"
      else
        render :edit
      end
    end

    def destroy
      @user.destroy

      redirect_to admin_users_path, success: "User successfully deleted"
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end

    def set_breadcrumbs
      add_breadcrumb("Admin", admin_dashboard_path)
      add_breadcrumb("Users", admin_users_path) unless params[:action] == "index"
    end
  end
end
