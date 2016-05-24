class AddColumnToColors < ActiveRecord::Migration
  def change
  	add_column :colors, :code, :string
  end
end
