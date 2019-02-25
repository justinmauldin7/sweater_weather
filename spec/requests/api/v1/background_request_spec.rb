require 'rails_helper'

describe 'Background API' do
  it 'sets background image to be of current location', :vcr do
    city = 'denver,co'
    attribute_keys = ["city", "state", "photo_id", "photo_secret",
                      "photo_server", "photo_farm", "photo_title", "photo_url"]

    get "/api/v1/backgrounds?location=#{city}"

    expect(response).to be_successful

    background = JSON.parse(response.body)

    expect(background["data"]["attributes"].keys).to eq(attribute_keys)
  end
end
