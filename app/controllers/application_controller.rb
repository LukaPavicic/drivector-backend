class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    auth_header = request.headers['Authorization']
    regex = /^Bearer /
    auth_header = auth_header.gsub(regex, '') if auth_header
    @current_user = AccessToken.get_user_from_token(auth_header)
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
