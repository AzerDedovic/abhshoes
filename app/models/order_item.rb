class OrderItem < ActiveRecord::Base
	belongs_to :order

	has_attached_file :image, styles: { 
		small: "120x120!"
	}
 
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
