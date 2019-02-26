require 'rails_helper'

describe Favorite do
  describe 'validations' do
    it { should validate_presence_of(:location) }
  end

  describe 'relationships' do
        it { should belong_to(:user) }
  end

  describe 'instance methods' do
    it "can return its user's api key" do
      email = "whatever@example.com"
      password = "password"
      api_key = "2017e35f6a05da1db87865129db345"
      city = "denver,co"

      user = User.create(email: email, password: password, password_confirmation: password, api_key: api_key)
      favorite = user.favorites.create(location: city)
      favorite_api_key = favorite.api_key

      expect(favorite.location).to eq(city)
      expect(favorite_api_key).to eq(api_key)
    end
  end
end
