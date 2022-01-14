FactoryBot.define do
  factory :following_tags_intermediate do
    association :following
    association :following_tag
  end
end
