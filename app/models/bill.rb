class Bill < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart

   	VALID_FULL_NAME_REGEX = /\A[a-zA-Z]{4,}\s*[a-zA-Z-\s]*\z/
   	validates(:full_name_bill, presence: true, length: {maximum: 120}, format: {with: VALID_FULL_NAME_REGEX})
   	VALID_ADDRESS_REGEX = /\A[a-zA-Z0-9-\s]*\z/
   	validates(:address_bill, presence: true, length: {maximum: 120}, format: {with: VALID_ADDRESS_REGEX})
   	VALID_CITY_REGEX = /\A^[a-zA-Z]*$\z/
   	validates(:city_bill, presence: true, length: {maximum: 120}, format: {with: VALID_CITY_REGEX})
   	VALID_REGION_REGEX = /\A^[a-zA-Z]+\s*[0-9]*$\z/
   	validates(:region_bill, presence: true, length: {maximum: 120}, format: {with: VALID_REGION_REGEX})
   	VALID_ZIP_REGEX = /\A^[a-zA-Z0-9]+$\z/
   	validates(:zip_bill, presence: true, length: {maximum: 20}, format: {with: VALID_ZIP_REGEX})
   	validates(:country_bill, presence: true, length: {maximum: 120})
   	#VALID_PHONE_REGEX = /\A^[(][+]\d{3}[)]\s\d{2}\s\d{3}[-]\d{3,4}$\z/
   	#validates(:phone, presence: true, format: {with: VALID_PHONE_REGEX})
   	validates(:phone_bill, presence: true)
end
