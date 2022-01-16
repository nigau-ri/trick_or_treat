FactoryBot.define do
  factory :room_detail do
    place             { Faker::Team.name }
    date              { Faker::Date.between(from: '2022-01-14', to: '2022-12-31') }
    number_of_people  { Faker::Number.between(from: 1, to: 20) }
    treat_id          { Faker::Number.between(from: 1, to: 2) }
    atmosphere        { Faker::Color.color_name }
    association :room
  end
end
