class FollowingTagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_following
  before_action ->{ensure_correct_user(@following.user)}

  def create
    @following_tag = FollowingTag.where(name: tag_params[:name]).first_or_initialize
    if @following_tag.save
      unless @following.following_tags.include?(@following_tag)
        FollowingTagsIntermediate.create(following_id: params[:following_id], following_tag_id: @following_tag.id)
      end
      redirect_to following_path(params[:following_id])
    else
      @following = Following.find(params[:following_id])
      @following_user = User.find(@following.following_id)
      render 'followings/show'
    end
  end

  private
  def tag_params
    params.require(:following_tag).permit(:name)
  end

  def set_following
    @following = Following.find(params[:following_id])
  end
end
