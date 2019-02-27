class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      user.favorites.create(location: params[:location])
      render json: {success: "200 OK"}, status: 200
    else
      render json: {error: "401 Unauthorized"}, status: 401
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if user && user.favorites.count > 0
      render json: FavoriteSerializer.new(user.favorites)
    else
      render json: {error: "401 Unauthorized"}, status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = user.favorites.find_by(location: params[:location])
      favorite.destroy
      render json: FavoriteSerializer.new(favorite)
    else
      render json: {error: "401 Unauthorized"}, status: 401
    end
  end
end
