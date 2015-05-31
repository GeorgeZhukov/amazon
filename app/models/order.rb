class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :customer
  belongs_to :credit_card

  POSSIBLE_STATES = %w(in\ progress completed shipped)

  validates :total_price, :completed_date, presence: true
  validates :state, inclusion: { in: POSSIBLE_STATES }
end
