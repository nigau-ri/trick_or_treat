class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])
    Good.create(good_params) if room.matched == 'yet'
    redirect_to room_path(params[:room_id])
  end

  def destroy
    good = Good.find(params[:id])
    good.destroy if current_user == good.user
    redirect_to room_path(params[:room_id])
  end

  private

  def good_params
    params.require(:good).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
