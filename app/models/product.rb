class Product < ActiveRecord::Base

	has_many :variants
	has_many :product_category
	has_many :images
	has_many :cart_item
	belongs_to :brand

	validates :name, :presence => true
	validates :description, :presence => true
	validates :brand_id, :presence => true
	validates :price, :presence => true

end
