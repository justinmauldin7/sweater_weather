class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      user.favorites.new(params[:location])
      render json: FavoriteSerializer.new(user)
    else
      render json: {error: "401 Unauthorized"}, status: 401
    end
  end
end
