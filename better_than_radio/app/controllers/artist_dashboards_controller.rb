class ArtistDashboardsController < ApplicationController
  before_action :ensure_artist_account, only: [:show]
  
  def show
  end
end
