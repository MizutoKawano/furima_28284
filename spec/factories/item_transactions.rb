FactoryBot.define do
  factory :item_transaction do
    arium_id       { 2 }
    city           { '渋谷区'  }
    house_number   { '渋谷'   }
    tellnum        { 12345678901 }
    postnum        { "123-1234" }
    token          { 'tok_kawano' }
   
  end
end
