class Users < ActiveRecord::Migration
  def self.up
  	create_table :users do |t|
  		t.column :username, :string
        t.column :password_hash, :string
        t.column :password_salt, :string
        t.column :firstName, :string
        t.column :lastName, :string
        t.column :created_at, :timestamp
        t.column :admin, :Boolean
    end
end

  def self.down
     drop_table :users
  end
end

