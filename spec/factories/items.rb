FactoryBot.define do
  factory :item do
    name               { 'aaa'}
    comment            { 'aaa'}
    day_id             { 2 }
    category_id        { 2 }
    fee_id             { 2 }
    status_id          { 2 }
    arium_id           { 2 }
    price              { 1000 }
    association :user 
    end
 end
