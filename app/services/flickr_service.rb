class FlickrService
  def self.single_photo(city)
    json = JSON.parse(self.photo_search_response(city).body, symbolize_names: true)
    @element = json[:photos][:photo][0]
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

  def self.photo_search_response(city)
    geocode = GoogleGeocodeService.new(city)
    conn.get do |req|
      req.url("/services/rest/")
      req.params["api_key"] = key
      req.params["method"] = "flickr.photos.search"
      req.params["tags"] = "landscape"
      req.params["safe_search"] = 1
      req.params["sort"] = "relevance"
      req.params["lat"] = geocode.latitude
      req.params["lon"] = geocode.longitude
      req.params["format"] = "json"
      req.params["nojsoncallback"] = "true"
    end
  end
end
