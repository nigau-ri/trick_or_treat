class RoomDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :treat
  belongs_to :room

  validates :treat_id, presence: true
end
