class Shipping < ApplicationRecord

  belongs_to :customer

  validates :recipient_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end
