class FansController < ApplicationController
  skip_before_action :require_account, only: [:new, :create]
  before_action :ensure_fan_owner, only: [:edit, :update]

  def show
    @fan = Fan.find(params[:id])
    @concerts = Concert.all
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
    @fan = current_account
  end

  def update
    fan = current_account
    
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
      :profile_picture,
    )
  end
end
