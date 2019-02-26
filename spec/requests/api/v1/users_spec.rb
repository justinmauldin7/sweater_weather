require 'rails_helper'

describe 'Users API' do
  it 'returns registered user with api_key', :vcr do
    email = "whatever@example.com"
    password = "password"
    password_confirmation = "password"
    created_status = 201
    unauthorized_status = 401
    api_key_length = 30

    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password_confirmation}"

    expect(response.status).to eq(created_status)
    expect(response.status).to_not eq(unauthorized_status)

    user = JSON.parse(response.body)

    expect(user['data']['attributes']['api_key'].length).to eq(api_key_length)
  end
end
