class Venue < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :contact_name, presence: true
  validates :phone, presence: true

  has_many :concerts

  mount_uploader :profile_picture, ImageUploader

  def self.text_search(query)
    if query.present?
      where("name ilike :q", q: "%#{query}%")
    else
      scoped
    end
  end
end
