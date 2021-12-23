class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sum_of_price(int_flg = false)
    # もしtrueなら¥を削除して数値として変換後に計算する
    ((item.price*quantity) * 1.1).floor
  end

  validates :size, presence: true
  validates :quantity, presence: true

end