class AddNameToMapshops < ActiveRecord::Migration[5.2]
  def change
    add_column :mapshops, :name, :string
  end
end
