class VenueDashboardsController < ApplicationController
  before_action :ensure_venue_account, only: [:show]

  def show
    @upcoming_concerts = Concert.where(venue: current_user.account).upcoming
    @past_concerts = Concert.where(venue: current_user.account).already_happened
  end
end
