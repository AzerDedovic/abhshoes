class Delivery < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart
	has_many :bills
	accepts_nested_attributes_for :bills

	validates :full_name, :presence => true
   validates :address, :presence =>true
   validates :city, :presence =>true
   validates :region, :presence =>true
   validates :country, :presence =>true
   validates :zip, :presence =>true
   validates :phone, :presence =>true

   	
   	
   	#validates_format_of :full_name, :multiline => true, with: /^[a-z ,.'-]+$/i, on: :create
   	#validates_length_of :full_name, minimum: 4, maximum: 50
   	#validates_format_of :city, :multiline => true, with: /^[a-z ,.'-]+$/i, on: :create
   	#validates_format_of :region, :multiline => true,  with: /^[a-z ,.'-]+$/i, on: :create
   	#validates_format_of :country,:multiline => true, with: /^[a-z ,.'-]+$/i, on: :create
   	#validates_format_of :zip, with:, :multiline => true, /^\d{5}(-\d{4})?$/i, on: :create
   	#validates_format_of :zip, with:,:multiline => true, /\A\d{3}-\d{3}-\d{4}\z/i, on: :create

   	
end
