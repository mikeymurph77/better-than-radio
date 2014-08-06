class User < ActiveRecord::Base
  belongs_to :account, polymorphic: true

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def fan?
    account_type == "fan"
  end

  def artist?
    account_type == "artist"
  end

  def venue?
    account_type == "venue"
  end
end
