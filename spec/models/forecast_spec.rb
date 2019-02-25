require 'rails_helper'

describe Forecast do
  describe 'instance variables' do
    xit 'has attributes', :vcr do
      location = "denver, co"
      city = "Denver"
      state = " CO"
      date = "02/24"
      time = "11:32 PM"
      weather_data = DarkSkyService.forecast(location)
      forecast = Forecast.new(weather_data, location)

      expect(forecast.city).to eq(city)
      expect(forecast.state).to eq(state)
      expect(forecast.date).to eq(date)
      expect(forecast.time).to eq(time)
    end
  end

  describe 'instance methods' do
    before :each do
      @location = "denver, co"
      @hours = 8
      @days = 6

      @current_weather = {:icon=>"Partly Cloudy",
                         :temperature=>25,
                         :feels_like=>19,
                         :humidity=>0.63,
                         :visibility=>10,
                         :uv_index=>0,
                         :summary=>"Light snow (1–4 in.) on Friday and Saturday, with high temperatures peaking at 56°F on Tuesday."}
      @weather_data = DarkSkyService.forecast(@location)
      @forecast = Forecast.new(@weather_data, @location)

    end
    it ".current", :vcr do
      expect(@forecast.current).to eq(@current_weather)
    end
    it ".hourly", :vcr do
      expect(@forecast.hourly.count).to eq(@hours)
    end
    it ".daily", :vcr do
      expect(@forecast.daily.count).to eq(@days)
    end
  end
end
