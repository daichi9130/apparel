class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id
      t.integer :item_id, null:false
      t.integer :quantity, null:false
      t.string :size, null:false
      t.string :note

      t.timestamps
    end
  end
end
