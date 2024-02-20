class TDirectStarMsgController < ApplicationController
  def create
    #check unlogin user
    # checkuser

    if params[:s_user_id].nil?
      # redirect_to home_url
    else
      @t_direct_star_msg = TDirectStarMsg.new
      @t_direct_star_msg.userid = params[:user_id]
      @t_direct_star_msg.directmsgid = params[:id]
      @t_direct_star_msg.save

      @s_user = MUser.find_by(id: params[:s_user_id])
      # redirect_to @s_user
      render json: { success: 'star successful'}
    end
  end

  def destroy
    #check unlogin user
    # checkuser

    if params[:s_user_id].nil?
      # redirect_to home_url
    else
      TDirectStarMsg.find_by(directmsgid: params[:id], userid: params[:user_id]).destroy

      @s_user = MUser.find_by(id: params[:s_user_id])
      render json: { success: 'star delete successful'}
    end
  end
end