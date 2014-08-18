class SearchesController < ApplicationController
  def show
    @artists = Artist.text_search(params[:query])
    @venues = Venue.text_search(params[:query])
    @query = params[:query]
  end
end
