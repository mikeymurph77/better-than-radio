class ConcertsController < ApplicationController
  before_action :ensure_venue_account, only: [:new, :create, :edit]

  def show
    
  end

  def new
    @concert = Concert.new
    @artists = Artist.all
  end

  def create
    @venue = current_user.id
    concert = Concert.new(concert_params.merge(venue_id: @venue))

    if concert.save
      redirect_to custom_dashboard_path
    else
      render :new
    end
  end

  private

  def concert_params
    params.require(:concert).permit(
      :date,
      :event_name,
      :tickets,
      :headliner_id,
      :additional_info,
    )
  end
end
