class ArtistsController <ApplicationController
  skip_before_action :require_account, only: [:new, :create]
  
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      current_user.update(account: @artist)
      redirect_to "#{current_user.account_type.downcase}_dashboard".to_sym
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
