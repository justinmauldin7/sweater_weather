require 'rails_helper'

describe 'Giphy API' do
  it 'returns giphy related to the current weather', :vcr do
    city = 'denver,co'
    time = "1551078000"
    summary = "Mostly cloudy until evening."
    url = "<GIPHY_URL_GOES_HERE>"
    days = 6
    attribute_keys = ["copyright", "images"]
    image_keys = ["time", "summary", "url"]

    get "/api/v1/gifs?location=#{city}"

    expect(response).to be_successful

    giphy = JSON.parse(response.body)

    expect(giphy["data"]["attributes"].keys).to eq(attribute_keys)
    expect(giphy["data"]["attributes"]["images"].count).to eq(days)
    expect(giphy["data"]["attributes"]["images"][0].keys).to eq(image_keys)
    expect(giphy["data"]["attributes"]["images"][0]["time"]).to eq(time)
    expect(giphy["data"]["attributes"]["images"][0]["summary"]).to eq(summary)
    expect(giphy["data"]["attributes"]["images"][0]["url"]).to eq(url)
  end
end
