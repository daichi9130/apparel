class RemoveSalesFromMapshops < ActiveRecord::Migration[5.2]
  def change
    remove_column :mapshops, :sales, :time
  end
end
