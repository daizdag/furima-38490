class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :state_id
  belongs_to :deliverycharge_id 
  belongs_to :sender_id
  belongs_to :scheduleddelivery_id
  belongs_to :user

end
