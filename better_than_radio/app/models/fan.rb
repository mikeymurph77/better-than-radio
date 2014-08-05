class Fan < ActiveRecord::Base
  has_one :user, as: :accounts
end
