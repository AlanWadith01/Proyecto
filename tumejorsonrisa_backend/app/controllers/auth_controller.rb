require 'jwt'

class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: :login

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { success: true, token: token }, status: :ok
    else
      render json: { success: false, error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, secret_key, 'HS256')
  end

  def secret_key
    ENV['JWT_SECRET_KEY'] || 'fallback_secret_key' 
  end

  def decoded_token
    token = request.headers['Authorization']&.split(' ')&.last
    begin
      JWT.decode(token, secret_key, true, { algorithm: 'HS256' })
    rescue JWT::DecodeError
      nil
    end
  end

  def authorize_request
    decoded_token_data = decoded_token
    if decoded_token_data
      user_id = decoded_token_data[0]['user_id']
      @current_user = User.find_by(id: user_id)
      render json: { success: false, error: 'Unauthorized' }, status: :unauthorized unless @current_user
    else
      render json: { success: false, error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
