class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user
  before_create :get_latitude, :get_longitude

  def api_key
    user.api_key
  end

  def current_weather
    DarkSkyService.cached_forecast(self.latitude, self.longitude)[:currently]
  end

  private

  def geocode_coordinates
    GoogleGeocodeService.new(self.location)
  end

  def get_latitude
    self.latitude = geocode_coordinates.latitude
  end

  def get_longitude
    self.longitude = geocode_coordinates.longitude
  end

end
