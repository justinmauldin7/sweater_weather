class DarkSkyService
  def self.forecast(city)
    geocode = GoogleGeocodeService.new(city)
    get_json("/forecast/#{key}/#{geocode.latitude},#{geocode.longitude}")
  end

  private

  def self.key
    ENV['DARK_SKY_API_KEY']
  end

  def self.conn
    Faraday.new(:url => 'https://api.darksky.net') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end
end
