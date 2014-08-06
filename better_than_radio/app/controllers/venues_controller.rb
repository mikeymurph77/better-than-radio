class VenuesController < ApplicationController
  skip_before_action :require_account, only: [:new, :create]

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      current_user.update(account: @venue)
      redirect_to "#{current_user.account_type.downcase}_dashboard".to_sym
    else
      render :new
    end
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name,
      :address,
      :city,
      :state,
      :contact_name,
      :phone,
      :capacity,
    )
  end
end
