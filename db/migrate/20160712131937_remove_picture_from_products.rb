class RemovePictureFromProducts < ActiveRecord::Migration
  def change

    remove_attachment :products, :picture
  end
  
end
