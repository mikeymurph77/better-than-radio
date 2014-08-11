class FansController < ApplicationController
  skip_before_action :require_account, only: [:new, :create]

  def show    
  end

  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.new(fan_params)

    if @fan.save
      current_user.update(account: @fan)
      redirect_to custom_dashboard_path
    else
      render :new
    end
  end

  def edit
    @fan = current_user.account
  end

  def update
    fan = current_user.account
    
    if fan.update(fan_params)
      redirect_to custom_profile_path
    else
      render :edit
    end
  end

  private

  def fan_params
    params.require(:fan).permit(
      :name,
      :location,
    )
  end
end
