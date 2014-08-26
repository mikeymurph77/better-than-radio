class Photo < ActiveRecord::Base
  has_many :comments, as: :commentable

  belongs_to :fan
  belongs_to :concert
  mount_uploader :image, ImageUploader
end
