module ApplicationHelper
  def google_map_tag(location)
    image_tag("http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=15&markers=#{location}")
  end

  def google_map_link(location)
    "https://www.google.com/maps/dir//#{location}"
  end
end
