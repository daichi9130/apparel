class AddTellToMapshops < ActiveRecord::Migration[5.2]
  def change
    add_column :mapshops, :tell, :string
  end
end
