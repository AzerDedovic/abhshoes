class AddColumnToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :brand, :string
  	remove_column :products, :image, :string
  end
end
