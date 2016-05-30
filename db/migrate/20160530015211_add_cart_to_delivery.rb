class AddCartToDelivery < ActiveRecord::Migration
  def change
  	add_reference :deliveries, :cart, index: true, foreign_key: true
  end
end
