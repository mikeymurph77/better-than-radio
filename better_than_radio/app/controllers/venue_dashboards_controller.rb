class VenueDashboardsController < ApplicationController
  before_action :ensure_venue_account, only: [:show]

  def show
    @upcoming_concerts = Concert.where(venue: current_user.account).after_today.next_first
    @past_concerts = Concert.where(venue: current_user.account).before_today.most_recent_first
  end
end
