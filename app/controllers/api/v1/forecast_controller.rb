class Api::V1::ForecastController < ApplicationController
  def index
    weather_data = DarkSkyService.forecast(params[:location])
    @current_forecast = CurrentForecast.new(weather_data, params[:location])
    @hourly_forecast = HourlyForecast.new(weather_data, params[:location])
    @daily_forecast = DailyForecast.new(weather_data, params[:location])
    render json: CurrentForecastSerializer.new(@current_forecast)
    render json: HourlyForecastSerializer.new(@hourly_forecast)
    render json: DailyForecastSerializer.new(@daily_forecast)
  end
end
