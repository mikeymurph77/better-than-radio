class User < ActiveRecord::Base
  belongs_to :account, polymorphic: true

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  letsrate_rater

  def fan?
    account_type == "Fan"
  end

  def artist?
    account_type == "Artist"
  end

  def venue?
    account_type == "Venue"
  end
end
