class FanDashboardsController < ApplicationController
  before_action :ensure_fan_account, only: [:show]
  
  def show
    @venues = Venue.where(state: current_user.account.location)
    @concerts = Concert.where(venue_id: @venues).next_first.after_today
  end
end
