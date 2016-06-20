class RemoveBrandFromProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :brand, :string
  	add_reference :products, :brand, index: true, foreign_key: true
  end
end
