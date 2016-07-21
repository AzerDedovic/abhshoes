class AddSaleprice < ActiveRecord::Migration
  def change
  	remove_column :products, :onSale_price, :decimal
  	add_column :products, :sale_price, :decimal
  end
end
