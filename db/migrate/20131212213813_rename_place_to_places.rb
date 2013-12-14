class RenamePlaceToPlaces < ActiveRecord::Migration
  def change
  	rename_table :place, :places
  end
end
