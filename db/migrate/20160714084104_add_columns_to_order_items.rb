class AddColumnsToOrderItems < ActiveRecord::Migration
  def change
  	remove_column :order_items, :image
  	add_attachment :order_items, :image
  	add_column :order_items, :picture, :string
  end
end

