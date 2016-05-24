class Products < ActiveRecord::Migration
  def change
  	create_table :products do |t|
  		t.string :name
  		t.text :description
  		t.decimal :price
  		t.datetime :created_at
  		t.datetime :updated_at
  		t.string :image
  		t.boolean :deleted
  	end

  end
end
