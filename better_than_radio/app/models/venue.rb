class Venue < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :contact_name, presence: true
  validates :phone, presence: true

  has_many :concerts
end
