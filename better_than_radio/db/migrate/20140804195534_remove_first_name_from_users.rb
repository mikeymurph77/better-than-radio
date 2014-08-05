class RemoveFirstNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :firstname
  end

  def down
    add_column :users, :firstname, :string, null: false
  end
end
