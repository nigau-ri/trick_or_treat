class HomeController < ApplicationController
  def index
    @rooms = Room.where(matched: 'yet')
  end
end
