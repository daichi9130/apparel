class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def sum_of_price
    item.sales_status_make*quantity
  end 

end
