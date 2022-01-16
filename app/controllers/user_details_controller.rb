class UserDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_detail, only: [:edit, :update]
  before_action -> { ensure_correct_user(@user_detail.user) }, only: [:edit, :update]

  def new
    @user_detail = UserDetail.new
  end

  def create
    @user_detail = UserDetail.new(user_detail_params)
    render :new unless @user_detail.save
  end

  def edit
  end

  def update
    render :edit unless @user_detail.update(user_detail_params)
  end

  private

  def user_detail_params
    params.require(:user_detail).permit(:age, :gender_id, :prefecture_id, :city, :hobby).merge(user_id: current_user.id)
  end

  def set_user_detail
    @user_detail = UserDetail.find(params[:id])
  end
end
