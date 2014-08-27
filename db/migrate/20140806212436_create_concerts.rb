class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.date :date, null: false
      t.string :event_name, null: false, default: ""
      t.integer :headliner_id, null: false
      t.string :tickets, null: false, default: ""
      t.string :additional_info, null: false, default: ""
      t.belongs_to :venue, null: false

      t.timestamps null: false
    end
  end
end
