module ApplicationHelper
  def google_map_tag(location)
    image_tag("http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=15&markers=#{location}")
  end

  def google_map_long(location)
    image_tag("http://maps.google.com/maps/api/staticmap?size=600x175&sensor=false&zoom=15&markers=#{location}")
  end

  def google_map_link(location)
    "https://www.google.com/maps/dir//#{location}"
  end

  def no_photo(concert)
    link_to image_tag("no_photo.jpg"), concert.headliner
  end

  def no_venue_photo
    image_tag("no_venue.jpg")
  end
end
