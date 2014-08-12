class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :fan

  validates :body, presence: true
  validates :commentable, presence: true
  validates :fan, presence: true
end
