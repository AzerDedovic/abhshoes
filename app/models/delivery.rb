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

   
   #validates_format_of :full_name, with:/([a-zA-Z,.'-]) ([a-zA-Z,.'-])/, on: :create
   #validates_length_of :full_name, minimum: 4, maximum: 50
   #validates_format_of :city, with:/([a-zA-Z,.'-]) ([a-zA-Z,.'-])/, on: :create
   #validates_format_of :region, with:/([a-zA-Z,.'-]) ([a-zA-Z,.'-])/, on: :create
   #validates_format_of :country, with:/([a-zA-Z,.'-]) ([a-zA-Z,.'-])/, on: :create
   #validates_format_of :zip, with:/^\d{5}(?:[-\s]\d{4})?$/ on: :create
   #validates_format_of :phone, with:,:multiline => true, /\A\d{3}-\d{3}-\d{4}\z/i, on: :create

   	
end
