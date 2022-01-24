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
    @following = Following.new(following_id: params[:following_user], user_id: current_user.id)
    redirect_to root_path unless @following.save
  end

  def destroy
    @following.destroy
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
