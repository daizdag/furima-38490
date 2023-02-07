class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :post_number,        format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}            
    validates :prefecture_id,      numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities    
    validates :address
    validates :telephone_number,   format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    
    Address.create(post_number: post_number, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end