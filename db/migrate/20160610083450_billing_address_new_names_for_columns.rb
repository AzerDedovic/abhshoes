class BillingAddressNewNamesForColumns < ActiveRecord::Migration
  def change
  	remove_column :bills, :full_name, :string
  	remove_column :bills, :address, :string
  	remove_column :bills, :city, :string
  	remove_column :bills, :region, :string
  	remove_column :bills, :zip, :string
  	remove_column :bills, :country, :string
  	remove_column :bills, :phone, :string

  	add_column :bills, :full_name_bill, :string
  	add_column :bills, :address_bill, :string
  	add_column :bills, :city_bill, :string
  	add_column :bills, :region_bill, :string
  	add_column :bills, :zip_bill, :string
  	add_column :bills, :country_bill, :string
  	add_column :bills, :phone_bill, :string


  end
end


