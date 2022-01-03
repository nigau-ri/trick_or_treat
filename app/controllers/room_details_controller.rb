class RoomDetailsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @room_detail = RoomDetail.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room_detail = RoomDetail.new(room_detail_params)
    if @room_detail.save
      redirect_to room_path(params[:room_id])
    else
      @room = Room.find(params[:room_id])
      render :new
    end
  end

  def edit
    @room_detail = RoomDetail.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  def update
    @room_detail = RoomDetail.find(params[:id])
    if @room_detail.update(room_detail_params)
      redirect_to room_path(params[:room_id])
    else
      @room = Room.find(params[:room_id])
      render :new
    end
  end

  private
  def room_detail_params
    params.require(:room_detail).permit(:place, :date, :number_of_people, :treat_id, :atmosphere).merge(room_id: params[:room_id])
  end
end
