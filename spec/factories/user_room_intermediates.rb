FactoryBot.define do
  factory :user_room_intermediate do
    association :user
    association :room
  end
end
