class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_room, only: [:show, :edit, :update, :destroy, :allow, :invite]
  before_action :user_of_this_room?, only: [:edit, :update, :destroy, :invite]
  before_action ->{set_user_of_create_this_room(@room)}, only: [:allow]
  before_action ->{ensure_correct_user(@user)}, only: [:allow]

  def show
    @message = Message.new
    @messages = @room.messages
    @good = Good.new
    @goods = @room.goods
    @user = User.find(@room.create_user_id)
    @user_room_intermediate = UserRoomIntermediate.new
  end

  def new
    redirect_to new_user_user_detail_path(current_user) and return if current_user.user_detail.blank?
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
    if params[:user_room_intermediate][:invited_user_id].present?
      invited_user = User.find(params[:user_room_intermediate][:invited_user_id])
      unless @room.users.include?(invited_user)
        UserRoomIntermediate.create(user_id: params[:user_room_intermediate][:invited_user_id], room_id: @room.id)
      end
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
