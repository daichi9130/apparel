class Item < ApplicationRecord
  attachment :image

  has_many :cart_items, dependent: :destroy
  has_many :order_detail

  def sales_status_text
    if sales_status == true
      "販売中"
    else
      "販売停止"
    end
  end

  def sales_status_make
    if sales_status == true
      (price * 1.1).to_i
    else
      "SOLD OUT"
    end
  end

end
