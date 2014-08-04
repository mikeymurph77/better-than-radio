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
end
