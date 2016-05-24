class Image < ActiveRecord::Base

	belongs_to :product
	has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150>"}

	validates_attachment :image,
    :presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|jpg)$/ }
end
