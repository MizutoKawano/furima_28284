class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  belongs_to :user
  belongs_to_active_hash :arium

  validates :arium_id, numericality: { other_than: 1 }

  with_options presence: true do
    post_number = /\A\d{3}[-]\d{4}\z/

    validates :arium
    validates :city
    validates :house_number
    validates :tellnum,        length: { maximum: 11 }
    validates :postnum,        format: { with: /#{post_number}/ }
    validates :user
    validates :item
  end
end
