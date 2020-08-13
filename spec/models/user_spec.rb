require 'rails_helper'
describe User, type: :model do
  describe 'ユーザー登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録ができる時' do
      it 'family_name、last＿name、kana_family_name、kana_last_name、nickname、email、password、password_confirmation、birthday、があれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上なら登録できる' do
        @user.password = 'AAA111'
        @user.password_confirmation = 'AAA111'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空だと保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが重複したら保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含めないと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank", 'Email は＠で入力して下さい。')
      end
      it 'パスワードが空だと保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは５文字以下だと保存できない ' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'パスワードは半角英数字混合出ないと保存できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英数字で入力して下さい。')
      end
      it 'パスワードは確認用を含めて2回入力しないと保存できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が空だと保存できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name は漢字で入力して下さい。')
      end
      it 'ユーザー本名の名前が空だと保存できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name は漢字で入力して下さい。')
      end
      it 'ユーザー本名の名字が（漢字・ひらがな・カタカナ）でないと保存できない' do
        @user.family_name = '亜あア'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'ユーザー本名の名前が（漢字・ひらがな・カタカナ）でないと保存できない' do
        @user.last_name = '亜あア'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'ユーザー本名のフリガナの名字が空だと保存できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank", 'Kana family name は全カタカナで入力して下さい。')
      end
      it 'ユーザー本名のフリガナの名前が空だと保存できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank", 'Kana last name は全カタカナで入力して下さい。')
      end
      it 'ユーザー本名の名字のフリガナは全角（カタカナ）でないと保存できない' do
        @user.kana_family_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name は全カタカナで入力して下さい。')
      end
      it 'ユーザー本名の名前のフリガナは全角（カタカナ）でないと保存できない' do
        @user.kana_last_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name は全カタカナで入力して下さい。')
      end
      it '生年月日が空だと保存できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
