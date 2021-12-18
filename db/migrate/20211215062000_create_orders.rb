class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :shipping_id, null: false
      t.integer :payment, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
