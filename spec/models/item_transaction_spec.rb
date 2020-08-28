require 'rails_helper'
describe ItemTransaction, type: :model do
    describe '購入機能' do
     before do
   @item_transaction = FactoryBot.build(:item_transaction)
   
  end

context '購入できない時' do

it "地域が空だと保存できない"do 
@item_transaction.arium_id = ""
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("Arium is not a number")
end
it "市区町村が空だと保存できない"do 
@item_transaction.city = ""
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("City can't be blank", "Postnum is invalid")
end
it "番地が空だと保存できない"do  
@item_transaction.house_number = ""
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("House number can't be blank", "Postnum is invalid")
end
it "電話番号が空と保存できない"do  
@item_transaction.tellnum = ""
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("Tellnum can't be blank", "Postnum is invalid")
end
it "電話番号が11文字以上だと保存できない"do 
@item_transaction.tellnum = "123456789012"
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("Tellnum is too long (maximum is 11 characters)")
end
it "郵便番号が空だと保存できない"do 
@item_transaction.postnum = ""
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("Postnum can't be blank", "Postnum is invalid")
end
it "郵便番号にはハイフンがないと保存できない"do 
@item_transaction.tellnum = "1234567"
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("Postnum is invalid")
end
it "トークンが空だと保存できない"do
@item_transaction.token = ""
@item_transaction.valid?
expect(@item_transaction.errors.full_messages).to include("Postnum is invalid", "Token can't be blank")
end
  end
 end
end