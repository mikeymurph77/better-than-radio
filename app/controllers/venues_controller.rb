class VenuesController < ApplicationController
  skip_before_action :require_account, only: [:new, :create]

  def new
    @venue = Venue.new
  end

  def show
    @venue = Venue.find(params[:id])
    @upcoming_concerts = Concert.where(venue: @venue).upcoming.page params[:page]
    @past_concerts = Concert.where(venue: @venue).already_happened.page params[:page]
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      current_user.update(account: @venue)
      redirect_to custom_dashboard_path
    else
      render :new
    end
  end

  def edit
    @venue = current_account
  end

  def update
    venue = current_account
    
    if venue.update(venue_params)
      redirect_to custom_profile_path
    else
      render :edit
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
      :profile_picture,
    )
  end
end
