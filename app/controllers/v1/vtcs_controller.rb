class V1::VtcsController < ApplicationController

  def index
    vtcs = Vtc.all
    render json: vtcs, status: 200
  end

  def create
    vtc = Vtc.new(vtc_params)
    vtc.user_id = @current_user.id

    if vtc.valid? && vtc.save
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
      render json: vtc.errors.messages, status: 400
    end
  end

  private
  def vtc_params
    params.require(:vtc).permit(:id, :name, :description, :minimum_age_to_join, :main_color, :pricing_plan)
  end
end
