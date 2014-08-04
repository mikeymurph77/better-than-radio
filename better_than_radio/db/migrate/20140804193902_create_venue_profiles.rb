class CreateVenueProfiles < ActiveRecord::Migration
  def change
    create_table :venue_profiles do |t|
      t.string :venuename, null: false
      t.string :location, null: false
      t.string :phonenumber, null: false
      t.string :contactname, null: false
      t.integer :capacity, null: false

      t.timestamps null: false
    end
  end
end
