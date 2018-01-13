FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.word.capitalize }
  end
end
