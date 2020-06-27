class V1::EventsController < ApplicationController

  def create
    event = Event.new(event_params)
    user_vtc = Vtc.find(UserJoinedVtc.find_by(user_id: @current_user.id).vtc_id)
    event.user = @current_user
    event.vtc = user_vtc
    if event.valid?
      begin
        authorize event
        if event.save
          render json: event, status: 201
        else
          render json: event.errors.full_messages, status: 400
        end
      rescue Pundit::NotAuthorizedError
        render json: { message: "You are not allowed to create events for this VTC. Only admins and moderators are allowed to do so." }, status: 403
      end
    else
      render json: event.errors.full_messages, status: 400
    end
  end

  private
  def event_params
    params.require(:event).permit(:id, :title, :description, :start_time, :start_city)
  end

end
