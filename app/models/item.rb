class Item < ApplicationRecord
  attachment :image

  has_many :cart_items, dependent: :destroy
  has_many :order_detail

  with_options presence: true do
    validates :image
    validates :item_name
    validates :price
    validates :genre
  end
  
  # 販売ステータス
  def sales_status_text
    if sales_status == true
      "販売中"
    else
      "販売停止"
    end
  end


  def sales_status_make
    if sales_status == true
      "¥#{(price * 1.1).floor}"
    else
      "SOLD OUT"
    end
  end

end
