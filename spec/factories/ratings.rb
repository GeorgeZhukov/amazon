FactoryGirl.define do
  factory :rating do
    review { Faker::Lorem.paragraph }
    number 1
    customer nil
    book nil
  end

end
