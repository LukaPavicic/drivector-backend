class V1::UserJoinedVtcController < ApplicationController
  def index
    users_joined_vtcs = UserJoinedVtc.all
    render json: users_joined_vtcs, status: 200
  end

  def create
    user_joined_vtc = UserJoinedVtc.new(user_joined_vtc_params)
    user_joined_vtc.user_id = @current_user.id
    if user_joined_vtc.valid? && user_joined_vtc.save
      render json: user_joined_vtc, status: 201
    else
      render json: user_joined_vtc.errors.messages, status: 400
    end
  end

  private
  def user_joined_vtc_params
    params.require(:user_joined_vtc).permit(:id, :vtc_id)
  end
end
