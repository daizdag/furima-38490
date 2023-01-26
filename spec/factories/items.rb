FactoryBot.define do
  factory :item do
    name                  {'test'}
    content               {'testtest'}
    category_id           {2}
    state_id              {2}
    deliverycharge_id     {2}
    sender_id             {2}  
    scheduleddelivery_id  {2}
    price                 {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
