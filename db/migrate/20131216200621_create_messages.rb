class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :content
      t.string :title
      t.integer :recipient_id
      t.timestamps
    end
  end
end
