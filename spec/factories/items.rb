FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Name.name }
    text { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    charge_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    days_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

     after(:build) do |item|
       item.image.attach(io: File.open('public/images/test_image.png'), filename: '')
     end
  end
end
