class Fan < ActiveRecord::Base
  has_many :users, as: :accounts
end
