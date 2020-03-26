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

  private
  def join_request_params
    params.require(:join_request).permit(:id, :vtc_id, :motivation_text)
  end
end
