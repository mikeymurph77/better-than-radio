class OpeningAct < ActiveRecord::Base
  belongs_to :artist
  belongs_to :concert

  validates :artist, presence: true
  validates :concert, presence: true
end
