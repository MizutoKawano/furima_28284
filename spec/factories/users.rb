FactoryBot.define do
  factory :user do
    family_name           { '亜あア' }
    last_name             { '亜あア' }
    kana_family_name      { 'カタカナ' }
    kana_last_name        { 'カタカナ' }
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { 'AAA111' }
    password_confirmation { password }
    birthday              { '1996-12-13' }
  end
end
