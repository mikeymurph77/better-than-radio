class FanDashboardsController < ApplicationController
  before_action :ensure_fan_account, only: [:show]
  
  def show
    @venues = Venue.where(state: current_account.location)
    @concerts = Concert.where(venue_id: @venues).upcoming.page params[:page]
  end
end
