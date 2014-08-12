class VenueDashboardsController < ApplicationController
  before_action :ensure_venue_account, only: [:show]

  def show
    @upcoming_concerts = Concert.where(venue: current_account).upcoming
    @past_concerts = Concert.where(venue: current_account).already_happened
  end
end
