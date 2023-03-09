class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  validates :nickname,           presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: 'は文字と数字の両方を含めてください'}

  validates :birthday,           presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' } do
    validates :first_name
    validates :last_name
  end  
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'は全角カタカナで入力ください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
    

  has_many   :items
  has_many   :orders

  
end
