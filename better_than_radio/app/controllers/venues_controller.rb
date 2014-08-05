class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      current_user.update(account: @venue)
      redirect_to root_path
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
