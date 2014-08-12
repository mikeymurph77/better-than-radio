class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
  end

  def create
    fan = current_account
    concert = Concert.find(params[:concert_id])
    photo = Photo.new(photo_params.merge(fan: fan, concert: concert))

    if photo.save
      redirect_to concert
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])

    if photo.update(photo_params)
      redirect_to photo
    else
      render :edit
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    concert = photo.concert
    photo.destroy

    redirect_to concert
  end

  private

  def photo_params
    params.require(:photo).permit(
      :description,
      :image,
      :concert,
      :fan,
    )
  end
end
