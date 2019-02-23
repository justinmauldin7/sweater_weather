class GoogleGeocodeService
  def initialize(city)
    @city = city
  end

  def latitude
    location_data[:results][0][:geometry][:location][:lat]
  end

  def longitude
    location_data[:results][0][:geometry][:location][:lng]
  end

  def location_data
    get_json("/maps/api/geocode/json?address=#{@city}")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end
end
