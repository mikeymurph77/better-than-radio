class Venue < ActiveRecord::Base
  has_one :user, as: :accounts

  validates :name, presence: true, uniqueness: true
end
