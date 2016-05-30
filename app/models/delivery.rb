class Delivery < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart
	has_many :bills
	accepts_nested_attributes_for :bills
end
