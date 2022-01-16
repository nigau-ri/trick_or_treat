class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def ensure_correct_user(user)
    redirect_to root_path unless current_user == user
  end

  def user_of_this_room?
    redirect_to root_path unless @room.users.include?(current_user)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_user_of_create_this_room(room)
    @user = User.find(room.create_user_id)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
