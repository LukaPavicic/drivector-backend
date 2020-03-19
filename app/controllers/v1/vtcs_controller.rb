class V1::VtcsController < ApplicationController
  before_action :authenticate_request

  def index
    vtcs = Vtc.all
    render json: vtcs, status: 200
  end

  def create
    vtc = Vtc.new(vtc_params)
    vtc.user_id = @current_user.id

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
    params.require(:vtc).permit(:id, :name, :description, :minimum_age_to_join, :main_color)
  end
end
