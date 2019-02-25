class GiphyService
  attr_reader :giphy_search_term
  
  def initialize(summary)
    @giphy_search_term = shorten_summary(summary)
  end

  def single_giphy_url
    JSON.parse(giphy_search_response.body, symbolize_names: true)[:data][0][:images][:fixed_width][:url]
  end

  private

  def shorten_summary(summary)
    short_summary = summary.split(" ")
    "#{short_summary[0]} #{short_summary[1]}"
  end

  def key
    ENV['GIPHY_API_KEY']
  end

  def conn
    Faraday.new(:url => 'https://api.giphy.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def giphy_search_response
    conn.get do |req|
      req.url("/v1/gifs/search")
      req.params["api_key"] = key
      req.params["q"] = @giphy_search_term
      req.params["limit"] = 4
      req.params["rating"] = "g"
      req.params["lang"] = "en"
      req.params["fmt"] = "json"
    end
  end
end
