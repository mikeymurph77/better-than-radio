class Artist < ActiveRecord::Base
  has_many :concerts

  mount_uploader :profile_picture, ImageUploader
end
