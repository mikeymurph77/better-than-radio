class User < ActiveRecord::Base
  belongs_to :account, polymorphic: true

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
