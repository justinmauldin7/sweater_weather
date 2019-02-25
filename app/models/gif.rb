class Gif
  attr_reader :city,
              :state,
              :date

  def initialize(weather_data, location)
    @city = location.split(",")[0].capitalize
    @state =location.split(",")[1].upcase

    @date = Time.now.strftime('%m/%d')

    @daily_weather_data = weather_data
  end

  def images
    (0..5).map do |day_index|
      daily_image(day_index)
    end
  end

  private

  def daily_image(index)
    {
      time: @daily_weather_data[:daily][:data][index][:time],
      summary: @daily_weather_data[:daily][:data][index][:summary],
      url: "url"
    }
  end
end
