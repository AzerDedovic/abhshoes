class Size < ActiveRecord::Base

	has_many :variants

	validates :size, :presence => true
   	validates_uniqueness_of :size
end
