class User < ActiveRecord::Base

   has_many :cart
   has_many :orders

   before_create :confirmation_token
   before_create { generate_token(:remember_token) }

   #attr_accessible :username, :password
   validates :username, :presence => true
   validates :password, :presence =>true #, :on => :create
   validates_confirmation_of :password #, :on => :create
   validates_uniqueness_of :username
   validates_format_of :username, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
   validates_length_of :password, minimum: 5, maximum: 30, :on => :create
   validates :password_confirmation , :presence => true, :on => :create


   #validates :password_confirmation, :presence => true
   #validates :username, :presence => true #, :unique => true
   #validates :username, presence: { message: "error" }
   #validates :password, :presence =>true,  :confirmation =>true
   #validates_confirmation_of :password
   #validates_uniqueness_of :username

   #validates_format_of :username, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
   #validates_length_of :password, minimum: 5, maximum: 30

   #validates :title, presence: { message: "Story title is required" }

   #before_save :encrypt_password
   #after_save :clear_password

   attr_accessor :password
   before_save :encrypt_password

   def has_password?(submitted_password)
      endcrypted_password = encrypt(submitted_password)
   end

   #def self.authenticate(username, password1)
   #	user = find_by_username(username)

   #	return nil if user.nil?
   #	return user if user.password==password1
   # #return user if user.has_password?(password1)
   #end

   def self.authenticate(username, password1)
      user = find_by_username(username)
      return nil if user.nil?
      return user if user.password_hash == BCrypt::Engine.hash_secret(password1, user.password_salt)
   end


   def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
   end

   def confirmation_token
      if self.confirm_token.blank?
         self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
   end

   def generate_token(column)
      begin
         self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
   end

#   def email_activate
#    self.email_confirmed = true
#    self.confirm_token = nil
#    save!(:validate => false)
#  end

   

end
