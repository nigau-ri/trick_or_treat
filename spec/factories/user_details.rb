FactoryBot.define do
  factory :user_detail do
    age           { Faker::Number.between(from: 20, to: 100) }
    gender_id     { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Gimei.unique.city.kanji }
    hobby         { Faker::Hobby.activity }
    association :user
  end
end
