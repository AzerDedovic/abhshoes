class Variant < ActiveRecord::Base

	belongs_to :product
	belongs_to :size
	belongs_to :color

	validates :size_id, :presence => true
	validates :color_id, :presence => true
	validates :product_id, :presence => true
	validates :quantity, :presence => true

	
end
