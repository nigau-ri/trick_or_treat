class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    Good.create(good_params)
    redirect_to room_path(params[:room_id])
  end

  def destroy
    good = Good.find(params[:id])
    redirect_to root_path and return unless current_user == good.user 
    good.destroy
    redirect_to room_path(params[:room_id])
  end

  private
  def good_params
    params.require(:good).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
