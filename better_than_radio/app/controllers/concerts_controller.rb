class ConcertsController < ApplicationController
  before_action :ensure_venue_account, only: [:new, :create, :edit]
  before_action :ensure_venue_owner, only: [:edit, :update]

  def show
    @concert = Concert.find(params[:id])
    @comment = Comment.new
    @comments = @concert.comments
  end

  def new
    @concert = Concert.new
    @artists = Artist.all
  end

  def create
    @venue = current_account
    concert = Concert.new(concert_params.merge(venue: @venue))

    if concert.save
      redirect_to custom_dashboard_path
    else
      render :new
    end
  end

  def edit
    @concert = Concert.find(params[:id])
    @artists = Artist.all
  end

  def update
    concert = Concert.find(params[:id])
    
    if concert.update(concert_params)
      redirect_to concert
    else
      render :edit
    end
  end

  def destroy
    concert = Concert.find(params[:id])
    concert.destroy

    redirect_to custom_dashboard_path
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
