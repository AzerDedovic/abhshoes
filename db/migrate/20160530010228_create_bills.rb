class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
    	t.string :full_name
    	t.string :address
    	t.string :city
    	t.string :region
    	t.string :zip
    	t.string :country
    	t.string :phone
    	

      t.timestamps null: false
    end
  end
end
