class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  include Pagy::Backend

end
