require 'rails_helper'
describe Item, type: :model do
  describe '出品機能' do
   before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload(Rails.root.join('spec', 'files', 'figure.png'))
  end


 
        context '出品できない時' do

        it "画像が一枚は必須"do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
         end

        it "商品名が空だと登録できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明が空だと登録できない"do
          @item.comment = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Comment can't be blank")
        end
        it "カテゴリーが空だと登録できない"do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
        it "状態が空だと登録できない"do
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Status is not a number")
        end
        it "送料が空だと登録できない"do
          @item.fee_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Fee is not a number")
        end
        it "地域が空だと登録できない"do
          @item.arium_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Arium is not a number")
        end
        it "日数が空だと登録できない"do
          @item.day_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Day is not a number")
        end
        it "価格が空だと登録できない"do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "価格の範囲が300-9999999まででないと登録できない"do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
       end
        it "ユーザーが紐付いていない出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
        end
 end
end
end
