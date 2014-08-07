class Concert < ActiveRecord::Base
  belongs_to :headliner, class_name: "Artist"
  belongs_to :venue

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
end
