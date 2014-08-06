class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :require_account, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      find_dashboard
    else
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

  def find_dashboard
    fan_dashboard || artist_dashboard || venue_dashboard
  end

  def fan_dashboard
    redirect_to :fan_dashboard
  end

  def artist_dashboard
    redirect_to :artist_dashboard
  end

  def venue_dashboard
    redirect_to :venue_dashboard
  end
end
