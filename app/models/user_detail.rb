class UserDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :prefecture
  belongs_to :user

  validates :gender_id, presence: true
end
