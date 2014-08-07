class VenueDashboardsController < ApplicationController
  before_action :ensure_venue_account, only: [:show]

  def show
    @concerts = Concert.where(venue_id: current_user)
  end
end
