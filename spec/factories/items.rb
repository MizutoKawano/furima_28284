FactoryBot.define do
  factory :item do
    name               { Faker::Team.name}
    comment            { Faker::Lorem.sentence}
    day_id             { 2 }
    category_id        { 2 }
    fee_id             { 2 }
    status_id          { 2 }
    arium_id           { 2 }
    price              {Faker::Number.number(300-999999)}
    association :user 
    end
 end
