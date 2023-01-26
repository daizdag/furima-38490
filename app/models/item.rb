class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :deliverycharge
  belongs_to :sender
  belongs_to :scheduleddelivery
  belongs_to :user
  has_one_attached :image



  validates :name,                  presence: true
  validates :content,               presence: true
  validates :category_id,           presence: true
  validates :state_id,              presence: true
  validates :deliverycharge_id,     presence: true
  validates :sender_id,             presence: true
  validates :scheduleddelivery_id,  presence: true
  validates :price,                 presence: true
  validates :image,                 presence: true



  
end
