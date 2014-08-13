class Photo < ActiveRecord::Base
  belongs_to :fan
  belongs_to :concert
  mount_uploader :image, ImageUploader
end
