require 'rails_helper'

describe 'Favorites API' do
  it 'creates favorite for a registered user and returns api_key', :vcr do
    email = "whatever@example.com"
    password = "password"
    city = "denver,co"
    api_key = "bfab8768f6a1932d68655e47699ce3"
    unauthorized_status = 401
    success_response = "200 OK"

    user = User.create(email: email, password: password, password_confirmation: password, api_key: api_key)

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"
    post "/api/v1/favorites?location=#{city}&api_key=#{api_key}"

    expect(response).to be_successful
    expect(response.status).to_not eq(unauthorized_status)

    favorite = JSON.parse(response.body)

    expect(favorite['success']).to eq(success_response)
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

  it 'returns list of locations for a user & the current weather', :vcr do
    email = "whatever@example.com"
    password = "password"
    city_1 = "denver,co"
    city_2 = "san diego,ca"
    city_3 = "dallas,tx"
    api_key = "bfab8768f6a1932d68655e47699ce3"
    unauthorized_status = 401

    user = User.create(email: email, password: password, password_confirmation: password, api_key: api_key)

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"
    post "/api/v1/favorites?location=#{city_1}&api_key=#{api_key}"
    post "/api/v1/favorites?location=#{city_2}&api_key=#{api_key}"
    post "/api/v1/favorites?location=#{city_3}&api_key=#{api_key}"
    get "/api/v1/favorites?api_key=#{api_key}"


    expect(response).to be_successful
    expect(response.status).to_not eq(unauthorized_status)

    favorite = JSON.parse(response.body)

    expect(favorite['data'][0]['attributes']['location']).to eq(city_1)
    expect(favorite['data'][0]['attributes']).to have_key('current_weather')
    expect(favorite['data'][1]['attributes']['location']).to eq(city_2)
    expect(favorite['data'][1]['attributes']).to have_key('current_weather')
    expect(favorite['data'][2]['attributes']['location']).to eq(city_3)
    expect(favorite['data'][2]['attributes']).to have_key('current_weather')
  end

  it 'renders 401 if user does not have any favorites', :vcr do
    email = "whatever@example.com"
    password = "password"
    api_key = "bfab8768f6a1932d68655e47699ce3"
    unauthorized_status = 401

    user = User.create(email: email, password: password, password_confirmation: password, api_key: api_key)

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"
    get "/api/v1/favorites?api_key=#{api_key}"


    expect(response.status).to eq(unauthorized_status)
    expect(response).to_not be_successful
  end

  it 'can delete a favorite', :vcr do
    email = "whatever@example.com"
    password = "password"
    city_1 = "denver,co"
    city_2 = "san diego,ca"
    city_3 = "dallas,tx"
    api_key = "bfab8768f6a1932d68655e47699ce3"
    unauthorized_status = 401

    user = User.create(email: email, password: password, password_confirmation: password, api_key: api_key)

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"
    post "/api/v1/favorites?location=#{city_1}&api_key=#{api_key}"
    post "/api/v1/favorites?location=#{city_2}&api_key=#{api_key}"
    post "/api/v1/favorites?location=#{city_3}&api_key=#{api_key}"
    delete "/api/v1/favorites?location=#{city_1}&api_key=#{api_key}"


    expect(response).to be_successful
    expect(response.status).to_not eq(unauthorized_status)

    favorite = JSON.parse(response.body)

    expect(favorite['data']['attributes']['location']).to eq(city_1)
    expect(favorite['data']['attributes']).to have_key('current_weather')
  end

  it 'renders 401 if api key is not sent when trying to delete a favorite', :vcr do
    email = "whatever@example.com"
    password = "password"
    city_1 = "denver,co"
    city_2 = "san diego,ca"
    city_3 = "dallas,tx"
    api_key = "bfab8768f6a1932d68655e47699ce3"
    bad_api_key = "bfab8768f6a1932d68655e47"
    unauthorized_status = 401

    user = User.create(email: email, password: password, password_confirmation: password, api_key: api_key)

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"
    post "/api/v1/favorites?location=#{city_1}&api_key=#{api_key}"
    post "/api/v1/favorites?location=#{city_2}&api_key=#{api_key}"
    post "/api/v1/favorites?location=#{city_3}&api_key=#{api_key}"
    delete "/api/v1/favorites?location=#{city_1}&api_key=#{bad_api_key}"


    expect(response.status).to eq(unauthorized_status)
    expect(response).to_not be_successful
  end
end
