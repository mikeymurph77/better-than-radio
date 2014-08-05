class Venue < ActiveRecord::Base
  has_many :users, as: :accounts

  validates :name, presence: true, uniqueness: true
end
