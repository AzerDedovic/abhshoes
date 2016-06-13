class BillingAddressAddColumn < ActiveRecord::Migration
  def change
	remove_reference :bills, :delivery, index: true, foreign_key: true  
	add_reference :bills, :cart, index: true, foreign_key: true
end
end
