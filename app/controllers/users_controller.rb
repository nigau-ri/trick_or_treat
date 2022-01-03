class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @users = User.where.not(id: current_user.id)
    else
      @users = User.all
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
