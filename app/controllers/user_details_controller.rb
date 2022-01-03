class UserDetailsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user_detail = UserDetail.new
  end

  def create
    @user_detail = UserDetail.new(user_detail_params)
    if @user_detail.save
      
    else
      render :new
    end
  end

  def edit
    @user_detail = current_user.user_detail
  end

  def update
    if current_user.user_detail.update(user_detail_params)
      
    else
      @user_detail = current_user.user_detail
      render :edit
    end
  end

  private
  def user_detail_params
    params.require(:user_detail).permit(:age, :gender_id, :prefecture_id, :city, :hobby).merge(user_id: current_user.id)
  end
end
