class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sum_of_price(int_flg = false)
    if int_flg
      # もしtrueなら¥を削除して数値として変換後に計算する
      item.sales_status_make.delete!("¥").to_i * quantity
    else
      item.sales_status_make*quantity
    end
  end

  validates :size, presence: true
  validates :quantity, presence: true

end