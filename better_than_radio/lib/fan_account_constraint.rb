class FanAccountConstraint
  def matches?(request)
    current_user = request.env["warden"].user
    current_user.fan?
  end
end
