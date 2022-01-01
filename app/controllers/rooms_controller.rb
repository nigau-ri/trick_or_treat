class RoomsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    room = Room.create(room_params)
    UserRoomIntermediate.create(user_id: current_user.id, room_id: room.id)
    redirect_to home_show_path
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
