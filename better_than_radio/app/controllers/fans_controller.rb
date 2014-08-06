class FansController < ApplicationController
  skip_before_action :require_account, only: [:new, :create]

  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.new(member_params)

    if @fan.save
      current_user.update(account: @fan)
      redirect_to "#{current_user.account_type.downcase}_dashboard".to_sym
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
