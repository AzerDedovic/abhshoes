class Product < ActiveRecord::Base

	has_many :variants
	has_many :product_category
	has_many :images
	has_many :cart_item

end
