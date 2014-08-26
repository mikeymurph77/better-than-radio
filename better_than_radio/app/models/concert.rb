class Concert < ActiveRecord::Base
  belongs_to :headliner, class_name: "Artist"
  belongs_to :venue

  has_many :opening_acts
  has_many :comments, as: :commentable
  has_many :photos, dependent: :destroy
  has_many :rsvps
  has_many :attendings, through: :rsvps, source: :fan

  validates :opening_acts, presence: true

  accepts_nested_attributes_for :opening_acts, reject_if: lambda { |record| record[:artist_id].blank? }

  letsrate_rateable "overall", "selection", "crowd"

  def self.headlining(artist)
    where(headliner: artist)
  end

  def self.next_concert
    upcoming.first
  end

  def self.last_concert
    already_happened.first
  end

  def self.upcoming
    next_first.after_today
  end

  def self.already_happened
    most_recent_first.before_today
  end

  def self.most_recent_first
    order("date DESC")
  end

  def self.next_first
    order("date ASC")
  end

  def self.before_today
    where("date < ?", Date.current)
  end

  def self.after_today
    where("date >= ?", Date.current)
  end

  def past?
    date < Date.current
  end
end
