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

  def kick
    # VTC Permissions:
    # 1 - member
    # 2 - moderator
    # 3 - admin
    # req_author = UserJoinedVtc.where(user_id: @current_user.id, vtc_id: params[:vtc_id]).first    
    @user_to_kick = UserJoinedVtc.where(vtc_id: params[:vtc_id], user_id: params[:user_id]).first
    begin
      authorize @user_to_kick
      @user_to_kick.destroy
      render json: { "message": "User has been kicked successfully!" }, status: 200
    rescue Pundit::NotAuthorizedError
      render json: { "message": "You don't have permissions to kick this user!" }, status: 400
    end
  end

  def promote
    @user_to_promote = UserJoinedVtc.where(vtc_id: params[:vtc_id], user_id: params[:user_id]).first
    begin
      authorize @user_to_promote
      @user_to_promote.permissions = 2
      @user_to_promote.save
      render json: { "message": "User promoted successfully!" }, status: 200
    rescue Pundit::NotAuthorizedError
      render json: { "message": "You can't do that." }, status: 400
    end            
  end

  def demote
    @user_to_demote = UserJoinedVtc.where(vtc_id: params[:vtc_id], user_id: params[:user_id]).first
    begin 
      authorize @user_to_demote
      @user_to_demote.permissions = 1
      @user_to_demote.save
      render json: { "message": "User demoted successfully!" }, status: 200
    rescue Pundit::NotAuthorizedError
      render json: { "message": "You are not allowed to do that!" }, status: 400
    end
  end

  private
  def user_joined_vtc_params
    params.require(:user_joined_vtc).permit(:id, :vtc_id)
  end
end
