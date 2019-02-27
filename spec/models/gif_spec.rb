require 'rails_helper'

describe Gif do
  describe 'instance variables' do
    it 'has attributes', :vcr do
      location = "denver, co"
      copyright = "2019"
      weather_data = DarkSkyService.forecast(location)
      gif = Gif.new(weather_data)

      expect(gif.copyright).to eq(copyright)
    end
  end

  describe 'instance methods' do
    it ".images", :vcr do
      location = "denver, co"
      days = 6
      summary = "Mostly cloudy throughout the day."
      url = "https://media2.giphy.com/media/HoUgegTjteXCw/200w.gif"

      image = {time: "1551250800",
                summary: summary,
                url: url
                }
      weather_data = DarkSkyService.forecast(location)
      gif = Gif.new(weather_data)

      expect(gif.images.count).to eq(days)
      expect(gif.images[0][:time]).to eq(image[:time])
      expect(gif.images[0][:summary]).to eq(image[:summary])
      expect(gif.images[0][:url]).to eq(image[:url])
    end

    it ".url", :vcr do
      location = "denver, co"
      summary = "Mostly cloudy throughout the day."
      url = "https://media2.giphy.com/media/HoUgegTjteXCw/200w.gif"

      weather_data = DarkSkyService.forecast(location)
      Gif.new(weather_data)
      gif_url = Gif.new(weather_data).url(summary)

      expect(gif_url).to eq(url)
    end
  end
end
