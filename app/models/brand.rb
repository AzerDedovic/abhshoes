class Brand < ActiveRecord::Base

	has_many :products

	validates :brand, :presence => true
   	validates_uniqueness_of :brand
   
end
