class MakeUserPolymorphic < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :integer
    add_column :users, :account_type, :string
  end
end
