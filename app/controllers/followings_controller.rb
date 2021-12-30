class FollowingsController < ApplicationController

  def index
  end

  def create
    following = Following.new(following_id: params[:following_user], user_id: current_user.id)
    if following.save
      redirect_to users_path
    else
      render 'users/index'
    end
  end

  def destroy
    following = Following.find_by(following_id: params[:id], user_id: current_user.id)
    following.destroy
    redirect_to users_path
  end
end
