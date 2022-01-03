class RoomDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :user_of_thie_room?
  
  def new
    @room_detail = RoomDetail.new
  end

  def create
    @room_detail = RoomDetail.new(room_detail_params)
    if @room_detail.save
      redirect_to room_path(params[:room_id])
    else
      render :new
    end
  end

  def edit
    @room_detail = RoomDetail.find(params[:id])
  end

  def update
    @room_detail = RoomDetail.find(params[:id])
    if @room_detail.update(room_detail_params)
      redirect_to room_path(params[:room_id])
    else
      render :new
    end
  end

  private
  def room_detail_params
    params.require(:room_detail).permit(:place, :date, :number_of_people, :treat_id, :atmosphere).merge(room_id: params[:room_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
