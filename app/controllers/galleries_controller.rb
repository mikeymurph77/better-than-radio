class GalleriesController < ApplicationController
  def show
    @concert = Concert.find(params[:id])
    @concert_photos = Photo.where(concert_id: @concert)
  end
end
