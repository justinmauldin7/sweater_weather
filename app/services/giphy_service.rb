class GiphyService
  def self.key
    ENV['GIPHY_API_KEY']
  end

  def self.conn
    Faraday.new(:url => 'https://api.giphy.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.giphy_search_response(city)
    conn.get do |req|
      req.url("/v1/gifs/search")
      req.params["api_key"] = key
      req.params["q"] = city
      req.params["limit"] = 4
      req.params["rating"] = "g"
      req.params["lang"] = "en"
      req.params["fmt"] = "json"
    end
  end
end
