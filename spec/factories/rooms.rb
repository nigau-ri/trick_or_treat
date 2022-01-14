FactoryBot.define do
  factory :room do
    name {Faker::Team.creature}
    create_user_id {1}
  end
end
