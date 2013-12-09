class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :user_id
      t.text :subject_id
      t.text :note
    end
  end
end
