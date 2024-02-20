class TDirectStarThreadController < ApplicationController
  def create
    #check unlogin user
    # checkuser

    if params[:s_direct_message_id].nil?
      unless params[:s_user_id].nil?
        @user = MUser.find_by(id: params[:s_user_id])
        render json: { error: 'go to user'}
      end
    elsif params[:s_user_id].nil?
      render json: { error: 'check user'}
    else
      @t_direct_star_thread = TDirectStarThread.new
      @t_direct_star_thread.userid = params[:user_id]
      @t_direct_star_thread.directthreadid = params[:id]
      @t_direct_star_thread.save

      @t_direct_message = TDirectMessage.find_by(id: params[:s_direct_message_id])
      render json: { success: 'start successful create'}
    end
  end

  def destroy
    #check unlogin user
    # checkuser

    if params[:s_direct_message_id].nil?
      unless params[:s_user_id].nil?
        @user = MUser.find_by(id: session[:s_user_id])
        render json: { error: 'go to user'}
      end
    elsif params[:s_user_id].nil?
      render json: { error: 'go to home'}
    else
      TDirectStarThread.find_by(directthreadid: params[:id], userid: params[:user_id]).destroy
      
      @t_direct_message = TDirectMessage.find_by(id: params[:s_direct_message_id])
      render json: { success: 'star delete successful'}
    end
  end
end