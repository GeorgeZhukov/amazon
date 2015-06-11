FactoryGirl.define do
  factory :book do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
    books_in_stock { Faker::Number.number(2) }
    author nil
    category nil
  end

end
