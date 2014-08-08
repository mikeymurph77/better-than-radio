class FansController < ApplicationController
  skip_before_action :require_account, only: [:new, :create]

  def show    
  end

  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.new(member_params)

    if @fan.save
      current_user.update(account: @fan)
      redirect_to custom_dashboard_path
    else
      render :new
    end
  end

  private

  def member_params
    params.require(:fan).permit(
      :name,
      :location,
    )
  end
end
