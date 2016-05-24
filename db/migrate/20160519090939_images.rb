class Images < ActiveRecord::Migration
  def change
  	create_table :images do |t|
  		t.references :product, index: true, foreign_key: true

  		t.boolean :default 

  		t.timestamps null: false
  	end
  end
end
