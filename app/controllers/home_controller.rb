class HomeController < ApplicationController
  def index
    @q = Room.where(matched: 'yet').ransack(params[:q])
    @rooms = @q.result
  end
end
