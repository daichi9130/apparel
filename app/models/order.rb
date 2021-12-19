class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  belongs_to :shipping

  def postage
    500
  end

end
