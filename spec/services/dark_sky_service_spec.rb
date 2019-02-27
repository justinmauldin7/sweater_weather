require 'rails_helper'

describe 'with a city & state' do
  it 'can send back current_weather', :vcr do
    city = 'denver,co'
    latitude = 39.7392358
    longitude = -104.990251
    temerpature = 27.17
    keys = [:latitude, :longitude, :timezone, :currently,
            :minutely, :hourly, :daily, :flags, :offset]

    forecast = DarkSkyService.forecast(city)

    expect(forecast.keys).to eq(keys)
    expect(forecast[:latitude]).to eq(latitude)
    expect(forecast[:longitude]).to eq(longitude)
    expect(forecast[:currently][:temperature]).to eq(temerpature)
  end

  it 'can send back current_weather for different city', :vcr do
    city = 'littleton,co'
    latitude = 39.613321
    longitude = -105.0166498
    temerpature = 31.51

    forecast = DarkSkyService.forecast(city)

    expect(forecast[:latitude]).to eq(latitude)
    expect(forecast[:longitude]).to eq(longitude)
    expect(forecast[:currently][:temperature]).to eq(temerpature)
  end

  it 'can send back cached current_weather data', :vcr do
    latitude = 39.7392358
    longitude = -104.990251
    temerpature = 28.22
    keys = [:latitude, :longitude, :timezone, :currently,
            :minutely, :hourly, :daily, :flags, :offset]

    forecast = DarkSkyService.cached_forecast(latitude, longitude)

    expect(forecast.keys).to eq(keys)
    expect(forecast[:latitude]).to eq(latitude)
    expect(forecast[:longitude]).to eq(longitude)
    expect(forecast[:currently][:temperature]).to eq(temerpature)
  end
end
