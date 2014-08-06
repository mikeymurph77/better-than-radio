class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  before_action :require_login
  before_action :require_account

  private

  def custom_dashboard_path
    polymorphic_path("#{current_user.account_type.downcase}_dashboard".to_sym)
  end
  helper_method :custom_dashboard_path

  def require_account
    if ! current_user.account
      redirect_to :create_account
    end
  end

  def ensure_fan_account
    unless current_user.fan?
      redirect_to custom_dashboard_path
    end    
  end

  def ensure_artist_account
    unless current_user.artist?
      redirect_to custom_dashboard_path
    end    
  end

  def ensure_venue_account
    unless current_user.venue?
      redirect_to custom_dashboard_path
    end    
  end
end
