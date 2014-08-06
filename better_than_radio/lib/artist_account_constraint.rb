class ArtistAccountConstraint
  def matches?(request)
    current_user = request.env["warden"].user
    current_user.artist?
  end
end
