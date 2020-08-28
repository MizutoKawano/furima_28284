class ItemTransaction
  include ActiveModel::Model
  attr_accessor :postnum, :arium_id, :city, :house_number, :building_name, :tellnum, :user_id, :item_id, :token

  with_options presence: true do
    
    post_number = /\A\d{3}[-]\d{4}\z/

    validates :arium_id
    validates :city
    validates :house_number
    validates :tellnum,        length: { maximum: 11 }
    validates :postnum,        format: { with: /#{post_number}/ }
    validates :token 
    validates :arium_id, numericality: { other_than: 1 }
  end

  def save
    Payment.create(user_id: user_id, item_id: item_id)
    Address.create(postnum: postnum, arium_id: arium_id, city: city, house_number: house_number, building_name: building_name, tellnum: tellnum, user_id: user_id, item_id: item_id)
  end
end
