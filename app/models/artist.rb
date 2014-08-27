class Artist < ActiveRecord::Base
  has_many :concerts, foreign_key: :headliner_id
  has_many :opening_acts

  validates :opening_acts, presence: true

  mount_uploader :profile_picture, ImageUploader

  def twitter?
    twitter.present?
  end

  def facebook?
    facebook.present?
  end

  def youtube?
    youtube.present?
  end

  def soundcloud?
    soundcloud.present?
  end

  def myspace?
    myspace.present?
  end

  def beatport?
    beatport.present?
  end

  def tumblr?
    tumblr.present?
  end


  def self.text_search(query)
    if query.present?
      where("name ilike :q", q: "%#{query}%")
    else
      scoped
    end
  end
end
