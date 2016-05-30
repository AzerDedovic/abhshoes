class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|

    	t.string :name
    	t.decimal :price
    	t.string :image
    	t.integer :size
    	t.string :color
    	t.integer :quantity
    	

      t.timestamps null: false
    end
  end
end
