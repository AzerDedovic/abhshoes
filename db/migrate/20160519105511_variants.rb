class Variants < ActiveRecord::Migration
  def change
  	create_table :variants do |t|
      t.references :product, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true
      t.references :color, index: true, foreign_key: true

      t.integer :quantity

      t.timestamps null: false

      
   end
  end
end
