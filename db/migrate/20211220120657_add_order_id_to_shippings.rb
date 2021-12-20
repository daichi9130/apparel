class AddOrderIdToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :order_id, :integer
  end
end
