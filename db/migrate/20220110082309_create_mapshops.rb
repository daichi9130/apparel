class CreateMapshops < ActiveRecord::Migration[5.2]
  def change
    create_table :mapshops do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
