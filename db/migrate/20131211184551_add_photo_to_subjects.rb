class AddPhotoToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :photo, :string
  end
end
