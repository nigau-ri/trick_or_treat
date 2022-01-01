class UserRoomIntermediate < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
