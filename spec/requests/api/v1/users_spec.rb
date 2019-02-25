require 'rails_helper'

describe 'Users API' do
  it 'returns registered user with api_key', :vcr do
    api_key =  "jgn983hy48thw9begh98h4539h4"
    status = 201
    email = "whatever@example.com"
    password = "password"
    password_confirmation = "password"

    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password_confirmation}"

    expect(response.status).to eq(status)

    user = JSON.parse(response.body)

    expect(user["api_key"]).to eq(api_key)
  end
end
