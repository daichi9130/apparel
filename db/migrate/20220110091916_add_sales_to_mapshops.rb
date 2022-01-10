class AddSalesToMapshops < ActiveRecord::Migration[5.2]
  def change
    add_column :mapshops, :sales, :time
  end
end
