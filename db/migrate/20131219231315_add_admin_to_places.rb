class AddAdminToPlaces < ActiveRecord::Migration
  def change
  	add_column :places, :admin, :boolean, :default => false
  end
end
