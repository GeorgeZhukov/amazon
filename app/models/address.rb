class Address < ActiveRecord::Base
  has_one :order
  belongs_to :country
  validates :address, :zip_code, :city, :phone, :country, presence: true
end
