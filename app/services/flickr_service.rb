class FlickrService
  def self.photo_search(city)
    geocode = GoogleGeocodeService.new(city)
    get_json("/services/rest/?api_key=#{key}&method=flickr.photos.search&tags=landscape&safe_search=1&sort=relevance&lat=#{geocode.latitude}&lon=#{geocode.longitude}&format=json&nojsoncallback=true")
  end

  def self.single_photo(city)
    @element = photo_search(city)[:photos][:photo][0]
  end

  def self.photo_url
    "https://farm#{@element[:farm]}.staticflickr.com/#{@element[:server]}/#{@element[:id]}_#{@element[:secret]}.jpg"
  end

  private

  def self.key
    ENV['FLICKR_API_KEY']
  end

  def self.conn
    Faraday.new(:url => 'https://api.flickr.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end
end
