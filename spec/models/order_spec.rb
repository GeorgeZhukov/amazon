require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { FactoryGirl.create :order }

  xit { expect(subject).to validate_presence_of(:total_price) }
  it { expect(subject).to validate_presence_of(:completed_date) }
  it { expect(subject).to belong_to(:customer) }
  it { expect(subject).to belong_to(:credit_card) }
  it { expect(subject).to have_many(:order_items) }


  it "has a default value" do
    subject.save
    expect(subject.state).to eq "in progress"
  end
end
