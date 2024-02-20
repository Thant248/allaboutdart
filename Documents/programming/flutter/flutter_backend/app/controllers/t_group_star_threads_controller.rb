class TGroupStarThreadsController < ApplicationController
  def create
    #check unlogin user
    # checkuser

    if params[:s_group_message_id].nil?
      unless params[:s_channel_id].nil?
        @m_channel = MChannel.find_by(id: params[:s_channel_id])
        render json: { error: 'go to home'}
      end
    elsif params[:s_channel_id].nil?
      render json: { error: 'go to channel'}
    elsif MChannel.find_by(id: params[:s_channel_id]).nil?
      render json: { error: 'go to home'}
    else
      @t_group_star_thread = TGroupStarThread.new
      @t_group_star_thread.userid = params[:user_id]
      @t_group_star_thread.groupthreadid = params[:id]
      @t_group_star_thread.save
      
      @t_group_message = TGroupMessage.find_by(id: params[:s_group_message_id])
      render json: { success: 'create star success '}
    end
  end

  def destroy
    #check unlogin user
    # checkuser

    if params[:s_group_message_id].nil?
      unless params[:s_channel_id].nil?
        @m_channel = MChannel.find_by(id: params[:s_channel_id])
        render json: { error: 'go to channel'}
      end
    elsif params[:s_channel_id].nil?
      render json: { error: 'go to home'}
    elsif MChannel.find_by(id: params[:s_channel_id]).nil?
      render json: { error: 'go to home'}
    else
      TGroupStarThread.find_by(groupthreadid: params[:id], userid: params[:user_id]).destroy

      @t_group_message = TGroupMessage.find_by(id: params[:s_group_message_id])
      render json: { success: 'delete star success'}
    end
  end
end