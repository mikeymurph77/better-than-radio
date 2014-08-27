class AddMediaToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :video_id, :string, null: false, default: ""
  end
end
