class CreateAccountsController < ApplicationController
  before_action :ensure_no_account, only: [:show]

  def show
  end

  private

  def ensure_no_account
    if current_user.account.present?
      redirect_to root_path
    end
  end
end
