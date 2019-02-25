class Api::V1::BackgroundsController < ApplicationController
  def index
    photo_data = FlickrService.single_photo(params[:location])
    @background = Background.new(photo_data, params[:location])
    render json: BackgroundSerializer.new(@background)
  end
end
