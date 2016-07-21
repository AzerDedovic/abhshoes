class AddOnSaleColumnToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :onSale, :boolean, :default => false
    add_column :products, :onSale_price, :decimal
  end
end
