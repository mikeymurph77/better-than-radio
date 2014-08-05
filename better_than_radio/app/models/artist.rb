class Artist < ActiveRecord::Base
  has_many :users, as: :accounts
end
