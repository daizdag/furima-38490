FactoryBot.define do
  factory :order_address do
    post_number { '123-4567' }
    prefecture_id { 2 }
    municipalities { '奈良市' }
    address { '1-1' }
    building_name { 'ハイツ' }
    telephone_number { '0900120090' }
    token  {"tok_abcdefghijk00000000000000000"}
    
  end
end
