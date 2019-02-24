class Api::V1::ForecastController < ApplicationController
  def index
    current_weather_data = DarkSkyService.forecast(params[:location])
    forecast = Forecast.new(current_weather_data)
    render json: ForecastSerializer.new(forecast)
  end
end
