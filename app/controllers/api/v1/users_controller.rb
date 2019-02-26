class Api::V1::UsersController < ApplicationController
  def create
    api_key = ApiKey.create_key
    user = User.new(email: user_params[:email],
                     password: user_params[:password],
                     password_confirmation: user_params[:password_confirmation],
                     api_key: api_key)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {}, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
