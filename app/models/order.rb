class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :shipping
  has_many :order_details, dependent: :destroy

  def postage
    500
  end

end
