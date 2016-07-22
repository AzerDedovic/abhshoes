class AddColumnOnSaleToOrderItems < ActiveRecord::Migration
  def change
  	add_column :order_items, :onSale, :boolean, :default => false
  end
end
