class AddColumnToTable < ActiveRecord::Migration
  def change
  	add_column :places, :address, :string
  	add_column :places, :phone, :string
  end
end
