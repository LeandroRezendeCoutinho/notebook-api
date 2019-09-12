class AuthsController < ApplicationController
  def create
    payload = { name: params[:name] }
    hmac_secret = 'my$ecretk3y'
    token = JWT.encode payload, hmac_secret, 'HS256'
    render json: { token: token }
  end
end
