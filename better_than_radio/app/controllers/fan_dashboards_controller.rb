class FanDashboardsController < ApplicationController

  before_action :ensure_fan_account, only: [:show]
  
  def show
  end
end
