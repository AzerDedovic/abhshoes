class Category < ActiveRecord::Base
	has_many :product_category

   validates :name, :presence => true
   validates :tag, :presence =>true 
   validates_uniqueness_of :name
   validates_uniqueness_of :tag

end
