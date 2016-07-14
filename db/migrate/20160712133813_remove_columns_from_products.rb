class RemoveColumnsFromProducts < ActiveRecord::Migration
  def change
  	remove_attachment :products, :picture
  	remove_column :products, :image
  end
end
