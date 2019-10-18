class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  
  after_action :verify_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
