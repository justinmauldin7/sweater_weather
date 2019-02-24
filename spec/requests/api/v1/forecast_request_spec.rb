require 'rails_helper'

describe 'Forecast API' do
  it 'returns current weather info for a city', :vcr do
    city = 'denver,co'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful
  end
end
