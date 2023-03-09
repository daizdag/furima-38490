class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :post_number,        format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はアドレスは次のように入力してください (例: 123-4567)"}            
    validates :prefecture_id,      numericality: {other_than: 1, message: "を入力してください"}
    validates :municipalities    
    validates :address
    validates :telephone_number
    validates :user_id
    validates :item_id
  end
  validates :telephone_number,   format: {with: /\A[0-9]{10,11}\z/, message: "は短いです"}, allow_blank: true  
  validates :telephone_number,   format: {with: /\A[0-9]{10,11}\z/, message: "は長いです"}, allow_blank: true  
  validates :telephone_number,   format: {with: /\d/, message: "は数字で入力してください"}, allow_blank: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    
    Address.create(post_number: post_number, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end