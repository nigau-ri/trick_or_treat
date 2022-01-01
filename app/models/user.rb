class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_detail, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :user_room_intermediates
  has_many :rooms, through: :user_room_intermediates
end
