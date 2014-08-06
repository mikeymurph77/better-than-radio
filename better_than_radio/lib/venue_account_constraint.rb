class VenueAccountConstraint
  def matches?(request)
    current_user = request.env["warden"].user
    current_user.venue?
  end
end
