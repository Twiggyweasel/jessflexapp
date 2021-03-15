module Admin
  class PagesController < ApplicationController
    layout "admin"

    def dashboard
      add_breadcrumb("Dashboard")
    end
  end
end
