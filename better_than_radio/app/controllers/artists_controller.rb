class ArtistsController <ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      current_user.update(account: @artist)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(
      :name,
      :genre,
      :contact_name,
      :contact_phone,
    )
  end
end
