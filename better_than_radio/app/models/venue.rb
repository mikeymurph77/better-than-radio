class Venue < ActiveRecord::Base
  has_many :users, :as => :profiles

  validates :name, presence: true, uniqueness: true
end
