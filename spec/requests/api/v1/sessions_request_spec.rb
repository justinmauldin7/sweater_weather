require 'rails_helper'

describe 'Sessions API' do
  it 'creates session for a registered user and returns api_key', :vcr do
    email = "whatever@example.com"
    password = "password"
    ok_status = 200
    unauthorized_status = 401
    api_key_length = 30

    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"

    post "/api/v1/sessions?email=#{email}&password=#{password}"

    expect(response.status).to eq(ok_status)
    expect(response.status).to_not eq(unauthorized_status)

    user = JSON.parse(response.body)

    expect(user['data']['attributes']['api_key'].length).to eq(api_key_length)

  end
end
