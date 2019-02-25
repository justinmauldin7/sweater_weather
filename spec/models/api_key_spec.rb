require 'rails_helper'

describe 'Api Key' do
  it 'returns an api_key', :vcr do
    api_key_length = 30
    api = ApiKey.create_key

    expect(api.length).to eq(api_key_length)
  end
end
