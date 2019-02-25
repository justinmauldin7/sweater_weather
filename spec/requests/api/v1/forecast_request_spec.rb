require 'rails_helper'

describe 'Forecast API' do
  it 'returns current weather info for a city', :vcr do
    city = 'denver,co'
    attribute_keys = ["city", "state", "date", "time", "current", "hourly", "daily"]
    current_forecast_keys = ["icon", "temperature", "feels_like",
                             "humidity", "visibility", "uv_index", "summary"]
    hourly_forecast_keys = ["hour", "temperature"]
    daily_forecast_keys = ["day", "icon", "percipitation", "temp_high", "temp_low"]
    days = 6
    hours = 8

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    expect(forecast["data"]["attributes"].keys).to eq(attribute_keys)
    expect(forecast["data"]["attributes"]["current"].keys).to eq(current_forecast_keys)
    expect(forecast["data"]["attributes"]["hourly"][0].keys).to eq(hourly_forecast_keys)
    expect(forecast["data"]["attributes"]["daily"][0].keys).to eq(daily_forecast_keys)
    expect(forecast["data"]["attributes"]["daily"].count).to eq(days)
    expect(forecast["data"]["attributes"]["hourly"].count).to eq(hours)
  end
end
