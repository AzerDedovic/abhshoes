class AddOrderToBill < ActiveRecord::Migration
  def change
  	add_reference :bills, :order, index: true, foreign_key: true
  	add_reference :bills, :delivery, index: true, foreign_key: true
  end
end
