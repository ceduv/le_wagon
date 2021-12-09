class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success_modal

  def configure_permitted_parameters
  # For additional fields in app/views/devise/registrations/new.html.erb
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

  # For additional in app/views/devise/registrations/edit.html.erb
  devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    if session[:list_ids].present?
      stored_location_for(resource) || list_path(session[:list_ids].last)
    else
      stored_location_for(resource) || lists_index_path
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "www.shotgunz.net" }
  end
end
