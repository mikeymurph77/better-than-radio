class Venue < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :contact_name, presence: true
  validates :phone, presence: true

  has_many :concerts

  mount_uploader :profile_picture, ImageUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def location
    "#{address},+#{city},+#{state}" 
  end

  private

  def location_changed?
    address_changed? || city_changed? || state_changed?
  end
end
