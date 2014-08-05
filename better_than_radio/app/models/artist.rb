class Artist < ActiveRecord::Base
  has_one :users, as: :accounts
end
