class V1::VtcsController < ApplicationController
  before_action :authenticate_request
  skip_before_action :authenticate_request, only: [:retrieve]

  def index
    vtcs = Vtc.all
    render json: vtcs, status: 200
  end

  def create
    vtc = Vtc.new(vtc_params)
    vtc.user_id = @current_user.id    
    vtc.pricing_plan = @current_user.subscription_type
    if @current_user.subscription_type == 0
      vtc.maximum_amount_of_users = 10
    elsif @current_user.subscription_type == 1
      vtc.maximum_amount_of_users = 30
    elsif @current_user.subscription_type == 2
      vtc.maximum_amount_of_users = 20000
    else
      vtc.maximum_amount_of_users = 0
    end
    vtc.increase_member_count
    if vtc.valid? && vtc.save
      # VTC Permissions:
      # 1 - member
      # 2 - moderator
      # 3 - admin
      UserJoinedVtc.create(user_id: @current_user.id, vtc_id: vtc.id, permissions: 3)
      render json: vtc, status: 201
    else
      render json: vtc.errors.messages, status: 400
    end
  end

  def retrieve_employees
    vtc = Vtc.find_by(id: params[:vtc_id])
    employees = UserJoinedVtc.where(vtc_id: vtc.id).all
    render json: employees, status: 200
  end

  def update_socials
    @vtc = Vtc.find_by(id: params[:vtc_id])
    begin 
      authorize @vtc
      if @vtc.update(vtc_socials_params)
        render json: @vtc, status: 200
      else
        render json: {"message": "Something went wrong. Try again later."}, status: 400
      end
    rescue Pundit::NotAuthorizedError
      render json: {"message": "You are not allowed to change VTCs socials."}, status: 403
    end      
  end

  def retrieve
    vtc = Vtc.find_by(id: params[:vtc_id])
    if vtc.present?
      render json: vtc, status: 200
    else
      render json: { "error_message": "VTC not found." }, status: 404
    end
  end

  private
  def vtc_params
    params.require(:vtc).permit(:id, :name, :description, :minimum_age_to_join, :main_color, :image)
  end

  def vtc_socials_params
    params.require(:vtc).permit(:twitter_link, :youtube_link, :discord_link, :facebook_link, :instagram_link, :twitch_link)
  end
end
