class AddPostalToMapshops < ActiveRecord::Migration[5.2]
  def change
    add_column :mapshops, :postal, :string
  end
end
