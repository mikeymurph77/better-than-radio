class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  before_action :require_login
  before_action :require_account

  private

  def require_account
    if ! current_user.account
      redirect_to :create_account
    end
  end

  def ensure_fan_account
    if current_user.account_type != "Fan"
      redirect_to "#{current_user.account_type.downcase}_dashboard".to_sym
    end    
  end

  def ensure_artist_account
    if current_user.account_type != "Artist"
      redirect_to "#{current_user.account_type.downcase}_dashboard".to_sym
    end    
  end

  def ensure_venue_account
    if current_user.account_type != "Venue"
      redirect_to "#{current_user.account_type.downcase}_dashboard".to_sym
    end    
  end
end
