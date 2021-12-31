class FollowingTagsIntermediate < ApplicationRecord
  belongs_to :following
  belongs_to :following_tag
end
