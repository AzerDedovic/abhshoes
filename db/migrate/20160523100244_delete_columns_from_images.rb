class DeleteColumnsFromImages < ActiveRecord::Migration
  def change
  	remove_column :images, :created_at, :timestamps
  	remove_column :images, :updated_at, :timestamps
  end
end
