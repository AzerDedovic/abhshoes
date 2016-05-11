class User < ActiveRecord::Base

   validates :password_confirmation, :presence =>true
   validates :username, :presence => true
   validates :password, :presence =>true,  :confirmation =>true
   validates_confirmation_of :password

   validates_format_of :username, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
   validates_length_of :password, minimum: 5, maximum: 30

   #before_save :encrypt_password
   #after_save :clear_password

   def has_password?(submitted_password)
      endcrypted_password = encrypt(submitted_password)
   end

   def self.authenticate(username, password1)
   	user = find_by_username(username)

   	return nil if user.nil?
   	return user if user.password==password1
   end

   

end
