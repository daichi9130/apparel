class AddClosedAtToMapshops < ActiveRecord::Migration[5.2]
  def change
    add_column :mapshops, :closed_at, :time
  end
end
