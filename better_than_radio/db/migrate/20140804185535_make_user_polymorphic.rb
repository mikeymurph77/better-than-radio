class MakeUserPolymorphic < ActiveRecord::Migration
  def change
    add_column :users, :profile_id, :integer
    add_column :users, :profile_type, :string
  end
end
