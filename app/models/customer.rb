class Customer < ActiveRecord::Base
  has_many :orders
  has_many :ratings
  has_secure_password

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, length: { in: 3..30 }

  before_save do
    self.email.downcase!
  end

  def create_new_order
    Order.new(customer: self)
  end

  def current_order_in_progress
    self.orders.in_progress.first
  end
end
