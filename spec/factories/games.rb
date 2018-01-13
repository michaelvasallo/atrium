FactoryBot.define do
  factory :game do
    title        { Faker::Game.name }
    description  { Faker::Lorem.paragraph }
    price        { Faker::Commerce.price }
    discount     { [Faker::Number.decimal(0, 2), 0].sample }
    release_date { Faker::Date.between 10.years.ago, Time.zone.today }
    association :developer, factory: :company
    association :publisher, factory: :company
  end
end
