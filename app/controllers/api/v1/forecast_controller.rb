class Api::V1::ForecastController < ApplicationController
  def index
    weather_data = DarkSkyService.forecast(params[:location])
    @forecast = Forecast.new(weather_data, params[:location])
    render json: ForecastSerializer.new(@forecast)
  end
end
