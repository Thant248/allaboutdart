class TGroupStarMsgsController < ApplicationController
  def create
    #check unlogin user
    # checkuser

    if params[:s_channel_id].nil?
      render json: { error: 'go to home'}
    elsif MChannel.find_by(id: params[:s_channel_id]).nil?
      render json: { error: 'go to home'}
    else
      @t_group_star_msg = TGroupStarMsg.new
      @t_group_star_msg.userid = params[:user_id]
      @t_group_star_msg.groupmsgid = params[:id]
      @t_group_star_msg.save
      
      @m_channel = MChannel.find_by(id: params[:s_channel_id])

      render json: { success: 'gp star successfull'}
    end
  end

  def destroy
    #check unlogin user
    # checkuser

    if params[:s_channel_id].nil?
      render json: { error: 'go to home'}
    elsif MChannel.find_by(id: params[:s_channel_id]).nil?
      render json: { error: 'go to home'}
    else
      TGroupStarMsg.find_by(groupmsgid: params[:id], userid: params[:user_id]).destroy
        
      @m_channel = MChannel.find_by(id: params[:s_channel_id])
      render json: { success: 'delete successfull'}
    end
  end
end