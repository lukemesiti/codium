class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception


  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    custom_fields = %i(given_name family_name bio tagline username slug image)
    devise_parameter_sanitizer.for(:sign_up) << custom_fields
    devise_parameter_sanitizer.for(:account_update) << custom_fields
  end

end
