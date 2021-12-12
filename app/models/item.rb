class Item < ApplicationRecord
  attachment :image

  def sales_status_text
    if sales_status == true
      "販売中"
    else
      "販売停止"
    end
  end
  
  def sales_status_make
    if sales_status == true
      price * 1.1
    else 
      "SOLD OUT"
    end 
  end 
    
end
