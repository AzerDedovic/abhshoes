class Color < ActiveRecord::Base

	has_many :variants

	validates :color, :presence => true
   	validates_uniqueness_of :color
   	validates :code, :presence => true
   	validates_uniqueness_of :code
end

