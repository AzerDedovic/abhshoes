class Delivery < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart
	
	

	#validates :full_name, :presence => true
   #validates :address, :presence =>true
   #validates :city, :presence =>true
   #validates :region, :presence =>true
   #validates :country, :presence =>true
   #validates :zip, :presence =>true
   #validates :phone, :presence =>true


   VALID_FULL_NAME_REGEX = /\A[a-zA-Z]{4,}\s*[a-zA-Z-\s]*\z/
   validates(:full_name, presence: true, length: {maximum: 120}, format: {with: VALID_FULL_NAME_REGEX})
   VALID_ADDRESS_REGEX = /\A[a-zA-Z0-9-\s]*\z/
   validates(:address, presence: true, length: {maximum: 120}, format: {with: VALID_ADDRESS_REGEX})
   VALID_CITY_REGEX = /\A^[a-zA-Z]*$\z/
   validates(:city, presence: true, length: {maximum: 120}, format: {with: VALID_CITY_REGEX})
   VALID_REGION_REGEX = /\A^[a-zA-Z]+\s*[0-9]*$\z/
   validates(:region, presence: true, length: {maximum: 120}, format: {with: VALID_REGION_REGEX})
   VALID_ZIP_REGEX = /\A^[a-zA-Z0-9]+$\z/
   validates(:zip, presence: true, length: {maximum: 20}, format: {with: VALID_ZIP_REGEX})
   validates(:country, presence: true, length: {maximum: 120})
   #VALID_PHONE_REGEX = /\A^[(][+]\d{3}[)]\s\d{2}\s\d{3}[-]\d{3,4}$\z/
   #validates(:phone, presence: true, format: {with: VALID_PHONE_REGEX})
   validates(:phone, presence: true)


   
   

   	
end
