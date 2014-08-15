class AddLatitudeLongitudeToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
  end
end
