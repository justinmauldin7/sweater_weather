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
    before :each do
      @location = "denver, co"
      @days = 6
      @summary = "Mostly cloudy until evening."
      @url = "https://media0.giphy.com/media/YdUdx8jPIKhxe/200w.gif"

      @image = {time: "1551078000",
                summary: @summary,
                url: @url
                }
      @weather_data = DarkSkyService.forecast(@location)
      @gif = Gif.new(@weather_data)
      @gif_url = Gif.new(@weather_data).url(@summary)
    end

    it ".images", :vcr do
      expect(@gif.images.count).to eq(@days)
      expect(@gif.images[0][:time]).to eq(@image[:time])
      expect(@gif.images[0][:summary]).to eq(@image[:summary])
      expect(@gif.images[0][:url]).to eq(@image[:url])
    end

    it ".url", :vcr do
      expect(@gif_url).to eq(@url)
    end
  end
end
