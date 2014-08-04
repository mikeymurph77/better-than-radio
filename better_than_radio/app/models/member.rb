class Member < ActiveRecord::Base
  has_many :users, :as => :profiles
end
