class CurrentForecast
  attr_reader :city,
              :state,
              :date,
              :time,
              :icon,
              :temperature,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :summary

  def initialize(weather_data, location)
    @city = location.split(",")[0].capitalize
    @state =location.split(",")[1].upcase

    @date = Time.now.strftime('%m/%d')
    @time = Time.now.strftime('%I:%M %p')

    @icon = weather_data[:currently][:summary]
    @temperature = weather_data[:currently][:temperature].to_i
    @feels_like = weather_data[:currently][:apparentTemperature].to_i
    @humidity = weather_data[:currently][:humidity]
    @visibility = weather_data[:currently][:visibility]
    @uv_index = weather_data[:currently][:uvIndex]
    @summary = weather_data[:daily][:summary]
  end
end
