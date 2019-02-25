class Background
  attr_reader :city,
              :state,
              :photo_id,
              :photo_secret,
              :photo_server,
              :photo_farm,
              :photo_title,
              :photo_url

  def initialize(photo_data, location)
    @city = location.split(",")[0].capitalize
    @state =location.split(",")[1].upcase

    @photo_id = photo_data[:id]
    @photo_secret = photo_data[:secret]
    @photo_server = photo_data[:server]
    @photo_farm = photo_data[:farm]
    @photo_title = photo_data[:title]
    @photo_url = url
  end

  def url
    "https://farm#{@photo_farm}.staticflickr.com/#{@photo_server}/#{@photo_id}_#{@photo_secret}.jpg"
  end
end
