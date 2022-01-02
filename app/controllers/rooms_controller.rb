class RoomsController < ApplicationController
  def index
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
  end

  def new
    @room = Room.new
  end

  def create
    room = Room.create(room_params)
    UserRoomIntermediate.create(user_id: current_user.id, room_id: room.id)
    redirect_to user_path(current_user)
  end

  def edit
    @room = Room.find(params[:id])
  end 

  def update
    room = Room.find(params[:id])
    room.update(room_params)
    redirect_to user_path(current_user)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to user_path(current_user)
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
