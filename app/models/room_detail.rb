class RoomDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :treat
  belongs_to :room

  validates :treat_id, numericality: {only_integer: true}
end
