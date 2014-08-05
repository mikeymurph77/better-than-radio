class FansController < ApplicationController
  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.new(member_params)

    if @fan.save
      current_user.update(account: @fan)
      redirect_to root_path
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
