class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name,                    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は漢字で入力して下さい。' }
  validates :last_name,                      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は漢字で入力して下さい。' }
  validates :kana_family_name,               presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全カタカナで入力して下さい。' }
  validates :kana_last_name,                 presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全カタカナで入力して下さい。' }
  validates :nickname,                       presence: true
  validates :email,                          presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'は＠で入力して下さい。' }
  validates :password,                       length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英数字で入力して下さい。' }
  validates :birthday,                       presence: true
end
