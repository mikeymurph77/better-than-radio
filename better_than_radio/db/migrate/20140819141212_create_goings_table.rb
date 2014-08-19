class CreateGoingsTable < ActiveRecord::Migration
  def change
    create_table :goings do |t|
      t.belongs_to :fan, index: true, null: false
      t.belongs_to :concert, index: true, null: false

      t.timestamps null: false
    end
    add_index :goings, [:fan_id, :concert_id], unique: true
  end
end
