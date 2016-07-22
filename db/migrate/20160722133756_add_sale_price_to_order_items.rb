class AddSalePriceToOrderItems < ActiveRecord::Migration
  def change
  	add_column :order_items, :sale_price, :decimal
  end
end
