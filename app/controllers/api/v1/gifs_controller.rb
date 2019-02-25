class Api::V1::GifsController < ApplicationController
  def index
    weather_data = DarkSkyService.forecast(params[:location])
    @gifs = Gif.new(weather_data)
    render json: GifSerializer.new(@gifs)
  end
end
