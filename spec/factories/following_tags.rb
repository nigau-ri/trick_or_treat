FactoryBot.define do
  factory :following_tag do
    name  { Faker::Color.color_name }
  end
end
