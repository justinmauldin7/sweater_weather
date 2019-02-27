require 'rails_helper'

describe 'with weather summary' do
  it 'can shorten summary', :vcr do
    summary = "Mostly cloudy until evening."
    short_summary = "Mostly cloudy"

    giphy = GiphyService.new(summary)

    expect(giphy.giphy_search_term).to eq(short_summary)
  end

  it 'can send back a giphy url', :vcr do
    summary = "Mostly cloudy until evening."
    url = "https://media2.giphy.com/media/HoUgegTjteXCw/200w.gif"

    giphy_url = GiphyService.new(summary).single_giphy_url

    expect(giphy_url).to eq(url)
  end
end
