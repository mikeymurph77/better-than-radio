class RsvpsController < ApplicationController
  def create
    concert = Concert.find(params[:concert_id])
    current_account.attend(concert)
    redirect_to concert
  end

  def destroy
    concert = Concert.find(params[:concert_id])
    current_account.cancel(concert)
    redirect_to concert
  end
end
