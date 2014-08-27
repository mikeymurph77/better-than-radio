class Fan < ActiveRecord::Base
  has_many :comments
  has_many :photos, dependent: :destroy
  has_many :rsvps
  has_many :concerts, through: :rsvps

  mount_uploader :profile_picture, ImageUploader

  def attend(concert)
    rsvps.create(concert: concert)
  end

  def cancel(concert)
    concerts.destroy(concert)
  end
end
