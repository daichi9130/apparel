class Item < ApplicationRecord
  attachment :image

  def sales_status_text
    if sales_status == true
      "販売中"
    else
      "販売停止"
    end
  end

end
