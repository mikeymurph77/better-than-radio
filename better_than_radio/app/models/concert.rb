class Concert < ActiveRecord::Base
  belongs_to :headliner, class_name: "Artist"
  belongs_to :venue

  has_many :comments, as: :commentable
  has_many :photos

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
