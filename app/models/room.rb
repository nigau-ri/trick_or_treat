class Room < ApplicationRecord
  has_many :users, through: :user_room_intermediates
  has_many :user_room_intermediates, dependent: :destroy 
end
