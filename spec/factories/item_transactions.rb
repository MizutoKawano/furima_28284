FactoryBot.define do
  factory :item_transaction do
    arium_id       { 2 }
    city           { '渋谷区'  }
    house_number   { '渋谷'   }
    tellnum        { 12_345_678_901 }
    postnum        { 123 - 4567 }
    token          { 'tok_kawano' }
   
  end
end
