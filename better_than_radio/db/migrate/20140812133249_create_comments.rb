class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :fan, index: true, null: false
      t.string :body, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false

      t.timestamps null: false
    end

    add_index :comments, :commentable_id
    add_index :comments, :commentable_type
  end
end
