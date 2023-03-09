class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :deliverycharge
  belongs_to :sender
  belongs_to :scheduleddelivery
  belongs_to :user
  has_one_attached :image
  has_one   :order



  validates :image,                 presence: true
  validates :name,                  presence: true
  validates :content,               presence: true
  validates :category_id,           numericality: { other_than: 1 , message: "を入力してください"}
  validates :state_id,              numericality: { other_than: 1 , message: "を入力してください"}
  validates :deliverycharge_id,     numericality: { other_than: 1 , message: "を入力してください"}
  validates :sender_id,             numericality: { other_than: 1 , message: "を入力してください"}
  validates :scheduleddelivery_id,  numericality: { other_than: 1 , message: "を入力してください"}
  validates :price,                 presence: true 
  validates :price,                 numericality: { only_integer: true, message: "価格は半角文字入力してください"}
  validates :price,                 numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "が設定範囲外です"}, allow_blank: true
                                    



  



  
end
