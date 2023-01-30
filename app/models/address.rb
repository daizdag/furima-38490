class Address < ApplicationRecord
  belongs_to: order

  validates :string,            presence: true
  validates :prefecture_id,     presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :municipalities,    presence: true
  validates :address,           presence: true
  validates :telephone_number,  presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

end
end
