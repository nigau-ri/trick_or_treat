class FollowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_following, only: [:show, :destroy]
  before_action -> { ensure_correct_user(@following.user) }, only: [:show, :destroy]

  def index
    @q = FollowingTag.ransack(params[:q])
    @following_tags = @q.result
  end

  def show
    @following_user = User.find(@following.following_id)
    @following_tag = FollowingTag.new
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
    @following.destroy
    redirect_to users_path
  end

  def search
    @q = FollowingTag.ransack(params[:q])
    @following_tag = FollowingTag.find(params[:q][:name])
  end

  private

  def set_following
    @following = Following.find(params[:id])
  end
end
