class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = user.favorites.create(location: params[:location])
      render json: FavoriteSerializer.new(favorite)
    else
      render json: {error: "401 Unauthorized"}, status: 401
    end
  end
end
