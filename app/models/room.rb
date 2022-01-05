class Room < ApplicationRecord
  has_many :user_room_intermediates, dependent: :destroy 
  has_many :users, through: :user_room_intermediates
  has_one :room_detail, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :goods, dependent: :destroy

  validates :create_user_id, presence: true
end
