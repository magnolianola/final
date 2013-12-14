class RenamePlacesToPlace < ActiveRecord::Migration
  def change
  	rename_table :places, :place
  end
end
