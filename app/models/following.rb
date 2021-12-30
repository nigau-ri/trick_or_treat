class Following < ApplicationRecord
  belongs_to :user

  validates :following_id, presence: true
end
