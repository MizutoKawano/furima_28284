class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
     with_options presence: true do

      亜あア=/\A[ぁ-んァ-ン一-龥]+\z/
      カナ=/\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/

     validates :family_name,         format: { with: /#{亜あア}/, message: 'は漢字で入力して下さい。' }
     validates :last_name,           format: { with: /#{亜あア}/, message: 'は漢字で入力して下さい。' }
     validates :kana_family_name,    format: { with: /#{カナ}/, message: 'は全カタカナで入力して下さい。' }
     validates :kana_last_name,      format: { with:/#{カナ}/, message: 'は全カタカナで入力して下さい。' }
     validates :nickname
     validates :email,               uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'は＠で入力して下さい。' }
     validates :birthday
   end
     validates :password,            length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英数字で入力して下さい。' }
 end
 
