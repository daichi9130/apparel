class AddBeginAtToMapshops < ActiveRecord::Migration[5.2]
  def change
    add_column :mapshops, :begin_at, :time
  end
end
