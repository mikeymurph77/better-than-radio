class Concert < ActiveRecord::Base
  belongs_to :headliner, class_name: "Artist"
  belongs_to :venue
end
