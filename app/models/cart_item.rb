class CartItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	
	validates :color, :presence => true
    validates :size, :presence =>true
    validates :quantity, :presence => true
    validates :cart_id, :presence => true
    validates :product_id, :presence =>true
    
end
