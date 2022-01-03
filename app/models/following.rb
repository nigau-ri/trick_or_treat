class Following < ApplicationRecord
  belongs_to :user
  has_many :following_tags_intermediates, dependent: :destroy
  has_many :following_tags, through: :following_tags_intermediates

  validates :following_id, presence: true
end
