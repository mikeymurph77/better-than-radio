class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artist_profiles do |t|
      t.string :artistname, null: false
      t.string :genre, null: false
      t.string :contactname, null: false
      t.string :contactphone, null: false

      t.timestamps null: false
    end
  end
end
