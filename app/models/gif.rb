class Gif
  attr_reader :copyright

  def initialize(weather_data, location)
    @copyright = Time.now.strftime('%Y')
    @daily_weather_data = weather_data
    @location = location
  end

  def images
    (0..5).map do |day_index|
      daily_image(day_index)
    end
  end

  def url
    GiphyService.new(@location)
  end

  private

  def daily_image(index)
    {
      time: @daily_weather_data[:daily][:data][index][:time].to_s,
      summary: @daily_weather_data[:daily][:data][index][:summary],
      url: url
    }
  end
end
