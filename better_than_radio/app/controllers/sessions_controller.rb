class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :require_account, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to custom_dashboard_path
    else
      flash[:error] = "Username and Password do not match...try again, or sign up"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to [:new, :session]
  end

  private

  def session_params
    params.require(:session).permit(:password, :username)
  end
end
