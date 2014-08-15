class AddLatitudeLongitudeToVenue < ActiveRecord::Migration
  def up
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
  end

  def down
    remove_column :venues, :latitude, :float
    remove_column :venues, :longitude, :float
  end
end
