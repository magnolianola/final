class AddMoreColumnsToTable < ActiveRecord::Migration
  def change
  	add_column :places, :hours, :string
  	add_column :places, :email, :string
  end
end
