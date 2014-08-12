class Fan < ActiveRecord::Base
  has_many :comments
  has_many :photos, dependent: :destroy
end
