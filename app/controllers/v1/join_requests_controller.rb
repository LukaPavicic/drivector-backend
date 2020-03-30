class V1::JoinRequestsController < ApplicationController
  def create
    join_request = JoinRequest.new(join_request_params)
    join_request.user = @current_user
    if join_request.save && join_request.valid?
      render json: join_request, status: 201
    else
      render json: join_request.errors.full_messages, status: 400
    end
  end

  def retrieve_for_vtc
    if (@current_user.user_joined_vtc.permissions == 3 || @current_user.user_joined_vtc.permissions == 2)
      join_requests = JoinRequest.where(vtc_id: @current_user.user_joined_vtc.vtc_id).all
      render json: join_requests, status: 200
    else
      render json: {"message": "You don't have permissions to access this data."}, status: 403
    end
  end

  private
  def join_request_params
    params.require(:join_request).permit(:id, :vtc_id, :motivation_text)
  end
end
