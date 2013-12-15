class AddPhotoToItem < ActiveRecord::Migration
  def change
  	add_column :items, :image, :string
  	add_column :items, :name, :string
  	add_column :items, :description, :text
  	add_column :items, :user_id, :integer
  end
end
