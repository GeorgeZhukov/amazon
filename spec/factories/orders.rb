FactoryGirl.define do
  factory :order do
    total_price { Faker::Commerce.price }
    completed_date { Faker::Time.between(2.days.ago, Time.now) }
    state "in progress"
    customer nil
    credit_card nil
  end

end
