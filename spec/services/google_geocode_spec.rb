require 'rails_helper'

describe 'with a city & state' do
  it 'can send back lat long', :vcr do
    city = 'denver,co'
    latitude = 39.7392358
    longitude = -104.990251

    geo_service = GoogleGeocodeService.new(city)

    expect(geo_service.latitude).to eq(latitude)
    expect(geo_service.longitude).to eq(longitude)
  end

  it 'can send back a different lat long', :vcr do
    city = 'littleton,co'
    latitude = 39.613321
    longitude = -105.0166498

    geo_service = GoogleGeocodeService.new(city)

    expect(geo_service.latitude).to eq(latitude)
    expect(geo_service.longitude).to eq(longitude)
  end
end
