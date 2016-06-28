class Product < ActiveRecord::Base

	has_many :variants
	has_many :product_category
	has_many :images
	has_many :cart_item
	belongs_to :brand

	has_attached_file :picture

  	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end
