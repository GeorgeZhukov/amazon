class Rating < ActiveRecord::Base
  belongs_to :customer
  belongs_to :book
  validates :review, :number, presence: true
  validates_inclusion_of :number, :in => 1..10
end
