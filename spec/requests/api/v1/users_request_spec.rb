require 'rails_helper'

describe 'Users API' do
  it 'creates registered user with api_key', :vcr do
    email = "whatever@example.com"
    password = "password"
    created_status = 201
    unauthorized_status = 401
    api_key_length = 30

    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"

    expect(response.status).to eq(created_status)
    expect(response.status).to_not eq(unauthorized_status)

    user = JSON.parse(response.body)

    expect(user['data']['attributes']['api_key'].length).to eq(api_key_length)
  end

  it "does not create user if passwords don't match", :vcr do
    email = "whatever@example.com"
    password = "password"
    bad_password = "password111"
    created_status = 201
    unauthorized_status = 401

    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{bad_password}"

    expect(response.status).to eq(unauthorized_status)
    expect(response.status).to_not eq(created_status)
  end
end
