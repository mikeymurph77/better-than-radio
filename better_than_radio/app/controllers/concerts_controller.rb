class ConcertsController < ApplicationController
  before_action :ensure_venue_account, only: [:new, :create, :edit]
  before_action :ensure_venue_owner, only: [:edit, :update]

  def show
    @concert = Concert.find(params[:id])
    @comment = Comment.new
    @comments = @concert.comments
    @new_photo = Photo.new
    @photos = @concert.photos
    @headliner = Artist.find_by(id: @concert.headliner_id)
  end

  def new
    @concert = Concert.new
    4.times { @concert.opening_acts.build }
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
    existing_number_of_opening_acts = @concert.opening_acts.count
    (4 - existing_number_of_opening_acts).times { @concert.opening_acts.build }
    @artists = Artist.all
  end

  def update
    @concert = Concert.find(params[:id])
    
    if @concert.update(concert_params)
      redirect_to @concert
    else
      @artists = Artist.all
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
      :opening_acts,
      :artist_id,
      opening_acts_attributes: [:id, :artist_id]
    )
  end
end
