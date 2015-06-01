class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :customer
  belongs_to :credit_card

  POSSIBLE_STATES = %w(in\ progress completed shipped)

  validates :total_price, :completed_date, presence: true
  validates :state, inclusion: { in: POSSIBLE_STATES }

  before_validation do
    # Default values
    self.state ||= POSSIBLE_STATES.first
  end

  before_save do
    self.calculate_total_price!
  end

  scope :in_progress, -> { where(state: POSSIBLE_STATES[0]) }

  def add_book(book)
    order_item = self.order_items.where(book: book).first
    if order_item
      order_item.quantity += 1
    else
      order_item = OrderItem.new(book: book, quantity: 1, order: self)
    end

    order_item.price=book.price
    order_item.save
  end

  def calculate_total_price
    item_prices = self.order_items.map {|order_item| order_item.quantity * order_item.price }
    item_prices.inject(&:+) || 0
  end

  def calculate_total_price!
    self.total_price = calculate_total_price
  end

  # TODO: Should have one billing address and one shipping address
end
