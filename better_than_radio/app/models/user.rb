class User < ActiveRecord::Base
  belongs_to :account, polymorphic: true

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def fan?
    account_type == "Fan"
  end

  def artist?
    account_type == "Artist"
  end

  def venue?
    account_type == "Venue"
  end

  def show_user_nav
    if account.present?
        link_to "Dashboard", custom_dashboard_path
        link_to "Profile", current_user.account
    end
  end
end
