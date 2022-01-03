class FollowingTag < ApplicationRecord
  has_many :following_tags_intermediates
  has_many :followings, through: :following_tags_intermediates

  validates :name, presence: true, uniqueness: true
end
