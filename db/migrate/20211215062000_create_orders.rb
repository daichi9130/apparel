class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :shipping_id, null: false
      t.integer :postage, null: false
      t.integer :payment, null: false
      t.integer :amount, null: false
      t.string :address, null: false
      t.string :post_code, null: false
      t.string :receiver, null: false

      t.timestamps
    end
  end
end
