class AddProfilePictureForEachAccount < ActiveRecord::Migration
  def self.up
    add_column :fans, :profile_picture, :string
    add_column :artists, :profile_picture, :string
    add_column :venues, :profile_picture, :string
  end

  def self.down
    remove_column :fans, :profile_picture
    remove_column :artists, :profile_picture
    remove_column :venues, :profile_picture
  end
end
