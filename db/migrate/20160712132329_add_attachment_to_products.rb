class AddAttachmentToProducts < ActiveRecord::Migration
  def change
  	add_attachment :products, :picture
  end
end
