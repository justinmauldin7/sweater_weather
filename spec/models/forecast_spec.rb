require 'rails_helper'

describe Forecast do
  describe 'instance variables' do
    it 'has attributes', :vcr do
      location = "denver, co"
      city = "Denver"
      state = " CO"
      date = Time.now.strftime('%m/%d')
      time = Time.now.strftime('%l:%M %p')
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

      @current_weather = {:icon=>"Mostly Cloudy",
                         :temperature=>27,
                         :feels_like=>22,
                         :humidity=>0.74,
                         :visibility=>7.76,
                         :uv_index=>4,
                         :summary=>"Snow (4–8 in.) over the weekend, with high temperatures falling to 18°F on Sunday."}
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
