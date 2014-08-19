class Artist < ActiveRecord::Base
  has_many :concerts, foreign_key: :headliner_id

  mount_uploader :profile_picture, ImageUploader

  def self.text_search(query)
    if query.present?
      where("name ilike :q", q: "%#{query}%")
    else
      scoped
    end
  end
end
