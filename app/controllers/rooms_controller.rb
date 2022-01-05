class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_room, only: [:show, :edit, :update, :destroy, :allow]
  before_action :user_of_this_room?, only: [:edit, :update, :destroy, :allow]

  def show
    @message = Message.new
    @messages = @room.messages
    @good = Good.new
    @goods = @room.goods
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
  end 

  def update
    @room.update(room_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @room.destroy
    redirect_to user_path(current_user)
  end

  def allow
    UserRoomIntermediate.create(user_id: params[:allowed_user_id], room_id: @room.id)
    redirect_to room_path(@room)
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
