class AddColumnsToProducts < ActiveRecord::Migration
  def change
  	add_attachment :products, :image
  	add_column :products, :picture, :string
  end
end
