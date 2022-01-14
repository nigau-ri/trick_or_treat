FactoryBot.define do
  factory :following do
    following_id {1}
    association :user
  end
end
