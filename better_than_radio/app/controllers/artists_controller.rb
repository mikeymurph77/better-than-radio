class ArtistsController <ApplicationController
  skip_before_action :require_account, only: [:new, :create]

  def show
    @artist = Artist.find(params[:id])
    @concerts = Concert.shows(@artist).upcoming
  end
  
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      current_user.update(account: @artist)
      redirect_to custom_dashboard_path
    else
      render :new
    end
  end

  def edit
    @artist = current_account
  end

  def update
    artist = current_account
    if artist.update(artist_params)
      redirect_to custom_profile_path
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(
      :name,
      :genre,
      :contact_name,
      :contact_phone,
      :bio,
      :website,
      :twitter,
      :facebook,
      :youtube,
      :soundcloud,
      :myspace,
      :beatport,
      :tumblr,
      :profile_picture,
    )
  end
end
