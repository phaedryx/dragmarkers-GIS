class Marker < ActiveRecord::Base

  attr_accessible :latitude, :longitude

  def longitude
    @longitude || lonlat.try(:longitude)
  end
  
  def latitude
    @latitude || lonlat.try(:latitude)
  end
  
  def longitude=(lon)
    @longitude  = lon
    @latitude   = latitude
    self.lonlat = "Point(#{@longitude} #{@latitude})"
  end
  
  def latitude=(lat)
    @longitude  = longitude
    @latitude   = (lat)
    self.lonlat = "Point(#{@longitude} #{@latitude})"
  end
  
  def as_json(options)
    {id: self.id, latitude: self.latitude, longitude: self.longitude, icon: self.icon}
  end
end
