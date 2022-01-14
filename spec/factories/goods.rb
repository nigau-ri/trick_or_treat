FactoryBot.define do
  factory :good do
    text {Faker::Lorem.sentence}
    association :user
    association :room
  end
end
