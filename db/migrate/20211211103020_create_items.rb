class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :genre, null: false
      t.string :image_id, null: false
      t.integer :price, null: false
      t.boolean :sales_status, null: false

      t.timestamps
    end
  end
end
