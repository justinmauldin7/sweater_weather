require 'rails_helper'

describe 'with a city & state' do
  it 'can send back a random photo in that city', :vcr do
    city = 'denver,co'
    farm = 8
    server = "7888"
    id = "40096180103"
    secret = "266b9984d4"

    photo = FlickrService.single_photo(city)

    expect(photo[:farm]).to eq(farm)
    expect(photo[:server]).to eq(server)
    expect(photo[:id]).to eq(id)
    expect(photo[:secret]).to eq(secret)
  end

  it 'can create URL with photo that is retruned', :vcr do
    city = 'denver,co'
    farm = 8
    server = "7888"
    id = "40096180103"
    secret = "266b9984d4"

    FlickrService.single_photo(city)
    url = FlickrService.photo_url

    expect(url).to eq("https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg")
  end
end
