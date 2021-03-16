class ApplicationController < ActionController::Base
  include Pagy::Backend

  add_flash_types :success, :danger
  helper_method :breadcrumbs

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role?(:admin)
      admin_dashboard_path
    else
      root_path
    end
  end
end
