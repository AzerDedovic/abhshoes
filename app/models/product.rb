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

	has_attached_file :image, styles: { 
		small: "120x120!", 
		mid: "180x180!", 
		mid1: "220x220!",
		large: "300x300!" 
	}
 
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


end
