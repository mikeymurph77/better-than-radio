class VenueDashboardsController < ApplicationController
  before_action :ensure_venue_account, only: [:show]

  def show
  end
end
