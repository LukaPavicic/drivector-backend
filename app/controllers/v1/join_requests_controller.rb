class V1::JoinRequestsController < ApplicationController
  def create
    join_request = JoinRequest.new(join_request_params)
    join_request.user = @current_user
    user_active_requests = JoinRequest.where(user_id: @current_user.id, status: 0).all
    same_request = JoinRequest.where(user_id: @current_user, vtc_id: params[:join_request][:vtc_id]).first
    if user_active_requests.length == 0
      if same_request.present?
        if same_request.can_submit_again?
          if join_request.save && join_request.valid?
            render json: join_request, status: 201
          else
            render json: join_request.errors.full_messages, status: 400
          end
        else
          render json: {"message": "You already sent a request to this VTC in the past 7 days."}, status: 400
        end
      else
        if join_request.save && join_request.valid?
          render json: join_request, status: 201
        else
          render json: join_request.errors.full_messages, status: 400
        end
      end
    else
      render json: {"message": "You already have an active join request."}, status: 200
    end
  end

  def handle_join_request
    join_request = JoinRequest.find_by(id: params[:join_request][:id])
    if params[:handle_code] == 1
      if (@current_user.user_joined_vtc.permissions == 3 || @current_user.user_joined_vtc.permissions == 2) && @current_user.user_joined_vtc.vtc_id == join_request.vtc_id
        join_request.accept
        UserJoinedVtc.create(user_id: join_request.user_id, vtc_id: join_request.vtc_id)
        render json: {"message": "User accepted"}, status: 201
      else
        render json: {"message": "You don't have permissions to do this action"}, status: 403
      end
    elsif params[:handle_code] == 2
      join_request.rejectJR(params[:rejection_message])
    else
      render json: {"message": "Code not recognized"}, status: 400
    end
  end

  def retrieve_for_vtc
    if (@current_user.user_joined_vtc.permissions == 3 || @current_user.user_joined_vtc.permissions == 2)
      join_requests = JoinRequest.where(vtc_id: @current_user.user_joined_vtc.vtc_id, status: 0).all
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
