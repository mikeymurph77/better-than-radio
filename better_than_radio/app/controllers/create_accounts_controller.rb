class CreateAccountsController < ApplicationController
  before_action :ensure_no_account, only: [:show]
  skip_before_action :require_account, only: [:show]

  def show
  end

  private

  def ensure_no_account
    if current_user.account.present?
      redirect_to "#{current_user.account_type.downcase}_dashboard".to_sym
    end
  end
end
