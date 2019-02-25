require 'rails_helper'

describe Background do
  describe 'instance variables' do
    it 'has attributes' do
      photo_data =  { id: "40096180103", secret: "266b9984d4", server: "7888",
                      farm: 8, title: "Smoky Gold"
                    }
      location = "denver, co"
      city = "Denver"
      state = " CO"
      background = Background.new(photo_data, location)
      expect(background.city).to eq(city)
      expect(background.state).to eq(state)
      expect(background.photo_id).to eq(photo_data[:id])
      expect(background.photo_secret).to eq(photo_data[:secret])
      expect(background.photo_server).to eq(photo_data[:server])
      expect(background.photo_farm).to eq(photo_data[:farm])
      expect(background.photo_title).to eq(photo_data[:title])
    end
  end

  describe 'instance methods' do
    it ".url" do
      photo_data =  { id: "40096180103", secret: "266b9984d4", server: "7888",
                      farm: 8, title: "Smoky Gold"
                    }
      location = "denver, co"
      city = "Denver"
      state = "CO"
      background_url = Background.new(photo_data, location).url
      expect(background_url).to eq("https://farm#{photo_data[:farm]}.staticflickr.com/#{photo_data[:server]}/#{photo_data[:id]}_#{photo_data[:secret]}.jpg")
    end
  end
end
