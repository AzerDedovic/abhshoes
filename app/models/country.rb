class Country < ActiveRecord::Base

	validates :country, :presence => true
   	validates :delivery, :presence =>true 
   	validates_uniqueness_of :country
end
