require 'rails_helper'

describe 'Forecast API' do
  it 'returns current weather info for a city', :vcr do
    city = 'denver,co'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful

    current_forecast = JSON.parse(response.body)
    keys = ["city", "state", "date", "time", "icon", "temperature",
            "feels_like", "humidity", "visibility", "uv_index", "summary"]
    explect(current_forecast["data"]["attributes"].keys).to eq(keys)
  end
end
