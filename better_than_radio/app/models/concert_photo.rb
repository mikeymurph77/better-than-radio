class ConcertPhoto < ActiveRecord::Base
  belongs_to :concert
  belongs_to :fan
end
