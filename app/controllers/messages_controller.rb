class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to room_path(params[:room_id])
    else
      render 'room/show'
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to room_path(params[:room_id])
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
