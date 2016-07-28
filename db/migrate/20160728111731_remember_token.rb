class RememberToken < ActiveRecord::Migration
  def change
  	remove_column :users, :remember_digest, :string
  	add_column :users, :remember_token, :string
  end
end
