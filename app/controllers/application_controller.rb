class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(*)
    groups_path
  end

  def after_sign_out_path_for(*)
    root_path
  end

  def configure_permitted_parameters
    default_parameters = %i[name role]
    devise_parameter_sanitizer.permit(:sign_up, keys: default_parameters)
    devise_parameter_sanitizer.permit(:sign_in, keys: default_parameters)
    devise_parameter_sanitizer.permit(:account_update) { |element| element.permit(:name, :email, :password, :current_password) }
  end
end
