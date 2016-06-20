class CreateBrand < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.string :brand
      	
      	t.timestamps null: false
    end
  end
end
