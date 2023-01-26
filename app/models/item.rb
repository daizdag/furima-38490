class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :deliverycharge
  belongs_to :sender
  belongs_to :scheduleddelivery
  belongs_to :user
  has_one_attached :image



  validates :image,                 presence: true
  validates :name,                  presence: true
  validates :content,               presence: true
  validates :category_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id,              numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliverycharge_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :sender_id,             numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduleddelivery_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                 presence: true 
  validates :price,                 numericality: { only_integer: true, message: "is invalid. Input half-width characters"}
  validates :price,                 numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "is out of setting range"} 
                                    



  



  
end
