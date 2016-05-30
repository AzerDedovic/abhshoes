class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :cart_item
	has_many :deliveries
end
