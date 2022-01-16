class HomeController < ApplicationController
  def index
    if params[:q]&.dig(:room_detail_place)
      squished_keywords = params[:q][:room_detail_place].squish
      params[:q][:room_detail_place_cont_any] = squished_keywords.split(' ')
    end
    @q = Room.where(matched: 'yet').ransack(params[:q])
    @rooms = @q.result
  end
end
