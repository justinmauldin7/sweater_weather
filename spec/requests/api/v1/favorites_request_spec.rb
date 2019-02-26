require 'rails_helper'

describe 'Favorites API' do
  it 'creates favorite for a registered user and returns api_key', :vcr do
    email = "whatever@example.com"
    password = "password"
    city = "denver,co"
    api_key = "bfab8768f6a1932d68655e47699ce3"
    unauthorized_status = 401

    user = User.create(email: email, password: password, password_confirmation: password, api_key: api_key)

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"
    post "/api/v1/favorites?location=#{city}&api_key=#{api_key}"

    expect(response).to be_successful
    expect(response.status).to_not eq(unauthorized_status)

    favorite = JSON.parse(response.body)

    expect(favorite['data']['attributes']['api_key']).to eq(api_key)
    expect(favorite['data']['attributes']['location']).to eq(city)
  end

  it 'does not create favorite if password is bad', :vcr do
    email = "whatever@example.com"
    password = "password"
    bad_password = "password1111"
    city = "denver,co"
    api_key = "2017e35f6a05da1db87865129db345"
    unauthorized_status = 401

    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
    post "/api/v1/sessions?email=#{email}&password=#{bad_password}"
    post "/api/v1/favorites?location=#{city}&api_key=#{api_key}"

    expect(response.status).to eq(unauthorized_status)
    expect(response).to_not be_successful
  end
end
