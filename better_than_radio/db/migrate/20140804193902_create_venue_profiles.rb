class CreateVenueProfiles < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :phone, null: false
      t.string :contact_name, null: false
      t.integer :capacity, null: false
      t.string :notes, null: false, default: ""

      t.timestamps null: false
    end
  end
end
