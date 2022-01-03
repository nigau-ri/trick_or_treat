class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def ensure_correct_user(user)
    redirect_to root_path unless current_user == user
  end

  def user_of_thie_room?
    redirect_to root_path unless @room.users.include?(current_user)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
