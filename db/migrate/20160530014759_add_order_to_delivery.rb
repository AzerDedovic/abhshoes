class AddOrderToDelivery < ActiveRecord::Migration
  def change
  	add_reference :deliveries, :order, index: true, foreign_key: true
  end
end
