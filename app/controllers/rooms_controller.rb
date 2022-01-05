class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_room, only: [:show, :edit, :update, :destroy, :allow, :invite]
  before_action :user_of_this_room?, only: [:edit, :update, :destroy, :allow, :invite]

  def show
    @message = Message.new
    @messages = @room.messages
    @good = Good.new
    @goods = @room.goods
    @user = User.find(@room.create_user_id)
    @user_room_intermediate = UserRoomIntermediate.new
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
    @room.update(matched: 'done')
    @room.goods.destroy_all
    redirect_to room_path(@room)
  end

  def invite
    invited_user = User.find(params[:user_room_intermediate][:invited_user_id])
    unless @room.users.include?(invited_user)
      UserRoomIntermediate.create(user_id: params[:user_room_intermediate][:invited_user_id], room_id: @room.id)
    end
    redirect_to room_path(@room)
  end

  private
  def room_params
    params.require(:room).permit(:name).merge(create_user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
