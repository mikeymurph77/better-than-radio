class Venue < ActiveRecord::Base
  has_many :users, :as => :profiles

  validates :venuename, presence: true, uniqueness: true
end
