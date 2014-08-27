class CreateAccountsController < ApplicationController
  before_action :ensure_no_account, only: [:show]
  skip_before_action :require_account, only: [:show]

  def show
  end

  private

  def ensure_no_account
    if current_account.present?
      redirect_to current_user_dashboard_path
    end
  end
end
