class RemoveFirstNameFromMonban < ActiveRecord::Migration
  def change
    remove_column :users, :firstname
  end
end
