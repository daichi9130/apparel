class Order < ApplicationRecord

  belongs_to :customer

  def postage
    500
  end

end
