class Artist < ActiveRecord::Base
  has_many :concerts
end
