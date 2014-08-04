class RenameVenuesTable < ActiveRecord::Migration
  def change
    rename_table :venue_profiles, :venues
  end
end
