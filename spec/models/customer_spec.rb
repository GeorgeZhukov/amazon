require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { FactoryGirl.create :customer }

  it { expect(subject).to validate_presence_of(:first_name) }
  it { expect(subject).to validate_presence_of(:last_name) }
  it { expect(subject).to validate_presence_of(:email) }
  it { expect(subject).to validate_uniqueness_of(:email) }
  it { expect(subject).to have_many(:orders) }
  it { expect(subject).to have_many(:ratings) }

  it "able to create a new order" do
    order = subject.create_new_order
    expect(order.class).to be Order
    expect(order.customer).to be subject
  end

  it "able to return a current order in progress" do
    order = subject.create_new_order
    order.add_book Book.new(title: "Atlas Shrugged", description: "Description", price: 99.99, books_in_stock: 10)
    order.customer = subject
    order.completed_date = DateTime.now
    order.total_price = 99.99
    order.save
    order = subject.current_order_in_progress
    expect(order.class).to be Order
  end

  xit "able to return a total price of the order" do

  end

end
