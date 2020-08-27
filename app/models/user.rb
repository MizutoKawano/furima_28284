class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :payment

  with_options presence: true do
    name_word = /\A[ぁ-んァ-ン一-龥]+\z/
    kana_word = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
    email_word = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    pass_word = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

    validates :family_name,         format: { with: /#{name_word}/, message: 'は漢字で入力して下さい。' }
    validates :last_name,           format: { with: /#{name_word}/, message: 'は漢字で入力して下さい。' }
    validates :kana_family_name,    format: { with: /#{kana_word}/, message: 'は全カタカナで入力して下さい。' }
    validates :kana_last_name,      format: { with: /#{kana_word}/, message: 'は全カタカナで入力して下さい。' }
    validates :nickname
    validates :email, uniqueness: true, format: { with: /#{email_word}/, message: 'は＠で入力して下さい。' }
    validates :birthday
  end

  pass_word = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  validates :password, length: { minimum: 6 }, format: { with: /#{pass_word}/, message: 'は英数字で入力して下さい。' }
 end
