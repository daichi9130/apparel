class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_detail

  def postage
    500
  end

end
