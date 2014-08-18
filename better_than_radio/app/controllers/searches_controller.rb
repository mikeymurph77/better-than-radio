class SearchesController < ApplicationController
  def show
    @query = params[:query]
    @artists = Artist.text_search(@query)
    @venues = Venue.text_search(@query)
  end
end
