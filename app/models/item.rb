class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :arium
  belongs_to_active_hash :day
  has_one_attached :image
  belongs_to :user

  validates :category_id, :status_id, :fee_id, :arium_id, :day_id, numericality: { other_than: 1 }

  with_options presence: true do

    validates :image
    validates :name 
    validates :comment
    validates :category
    validates :status
    validates :fee
    validates :arium
    validates :day
    validates :price,  inclusion: { in: (300..9999999)}
  end
end
