class FollowingTagsController < ApplicationController
  def create
    @following_tag = FollowingTag.new(tag_params)
    if @following_tag.save
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
end
