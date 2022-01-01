class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
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
