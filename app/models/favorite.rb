class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user

  def api_key
    user.api_key
  end

  def current_weather
    DarkSkyService.forecast(self.location)[:currently]
  end
end
