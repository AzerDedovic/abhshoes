class Delivery < ActiveRecord::Base
	belongs_to :order
	belong_to :cart
	has_many :bills
	accepts_nested_attributes_for :bills
end
