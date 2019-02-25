class Forecast
  attr_reader :city,
              :state,
              :date,
              :time

  def initialize(weather_data, location)
    @city = location.split(",")[0].capitalize
    @state =location.split(",")[1].upcase

    @date = Time.now.strftime('%m/%d')
    @time = Time.now.strftime('%l:%M %p')

    @weather_data = weather_data
  end

  def current
    {
      icon: @weather_data[:currently][:summary],
      temperature: @weather_data[:currently][:temperature].to_i,
      feels_like: @weather_data[:currently][:apparentTemperature].to_i,
      humidity: @weather_data[:currently][:humidity],
      visibility: @weather_data[:currently][:visibility],
      uv_index: @weather_data[:currently][:uvIndex],
      summary: @weather_data[:daily][:summary]
    }
  end

  def hourly
    (0..7).map do |hour_index|
      forecast_hour(hour_index)
    end
  end

  def daily
    (0..5).map do |day_index|
      forecast_day(day_index)
    end
  end

  private

  def forecast_hour(index)
    {
      hour: Time.at(@weather_data[:hourly][:data][index][:time]).strftime('%l %p'),
      temperature: @weather_data[:hourly][:data][index][:temperature].to_i,
    }
  end

  def forecast_day(index)
    {
      day: Time.at(@weather_data[:daily][:data][index][:time]).strftime('%A'),
      icon: @weather_data[:daily][:data][index][:icon],
      percipitation: (@weather_data[:daily][:data][index][:precipProbability]*1000).to_i,
      temp_high: @weather_data[:daily][:data][index][:temperatureHigh].to_i,
      temp_low: @weather_data[:daily][:data][index][:temperatureLow].to_i,
    }
  end
end
