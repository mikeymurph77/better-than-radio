class RenameArtistsTable < ActiveRecord::Migration
  def change
    rename_table :artist_profiles, :artists
  end
end
