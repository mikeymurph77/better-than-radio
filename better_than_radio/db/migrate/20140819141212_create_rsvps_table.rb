class CreateRsvpsTable < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.belongs_to :fan, index: true, null: false
      t.belongs_to :concert, index: true, null: false

      t.timestamps null: false
    end
    add_index :rsvps, [:fan_id, :concert_id], unique: true
  end
end
