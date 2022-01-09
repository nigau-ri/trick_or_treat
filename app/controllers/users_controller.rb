class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update]
  before_action ->{ensure_correct_user(@user)}, except: [:index, :show]

  def index
    if user_signed_in?
      @users = User.where.not(id: current_user.id)
    else
      @users = User.all
    end
  end
  
  def show
    @rooms = Room.where(create_user_id: @user.id, matched: 'yet')
  end

  def edit
  end

  def update
    render :edit unless @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
