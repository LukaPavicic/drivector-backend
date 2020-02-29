class V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :register]

  def register
    user = User.new(user_params)

    if user.valid? && user.save
      render json: user,
             status: 201
      return
    end
    render json: user.errors,
           status: 400
  end

  def login
    email = params[:user][:email]
    password = params[:user][:password]
    user = User.find_by(email: email)
    is_valid = user && user.valid_password?(password)
    unless is_valid
      render json: {
        status: "error",
        message: "Invalid credentials"
      }, status: 400 and return
    end
    payload = { user_id: user.id }
    access_token = AccessToken.encode(payload)
    render json: user, meta: { access_token: access_token }, status: 200
  end

  def current_user_data
    render json: @current_user, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :age, :tmp_profile_link, :steam_profile_link, :username)
  end
end
