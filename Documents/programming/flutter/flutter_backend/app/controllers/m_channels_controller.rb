class MChannelsController < ApplicationController
  before_action :set_m_channel, only: %i[ show update destroy ]

  # GET /m_channels
  def index
    @m_channels = MChannel.all

  end

  # GET /m_channels/1
  def show
      mChannel = MChannel.find_by(id: params[:id])
      if mChannel
      else
        render json: {error: "MChannel not found"}, status: :not_found
      #   retrieve_group_message

      # #call from ApplicationController for retrieve home data
      # retrievehome
      end
    end

  # POST /m_channels
  def create
    # retrievehome
      @m_channel = MChannel.new()
      @m_channel.channel_status = params[:channel_status]
      @m_channel.m_workspace_id =params[:m_workspace_id]
      @m_channel.channel_name = params[:channel_name]
      if @m_channel.save
        @t_user_channel = TUserChannel.new
        @t_user_channel.message_count = 0
        @t_user_channel.unread_channel_message = 0
        @t_user_channel.created_admin = 1
        @t_user_channel.userid =params[:user_id]
        @t_user_channel.channelid = @m_channel.id
        @t_user_channel.save
        # render json: @m_channel, status: :created, location: @m_channel
        render json: @t_user_channel
      else
        render json: { error: 'error'}
        # render json: @m_channel.errors, status: :unprocessable_entity
    end
  end

  # def refresh_group
    
  #  if MChannel.find_by(id: params[:id]).nil?
  #     redirect_to home_url
  #   else
  #     if session[:r_group_size].nil?
  #       session[:r_group_size] =  10
  #     else
  #       session[:r_group_size] +=  10
  #     end

  #     #call from ApplicationController for retrieve group message data
  #     retrieve_group_message

  #     #call from ApplicationController for retrieve home data
  #     retrievehome
  #   end
  # end

  def edit
    if MChannel.find_by(id: params[:id]).nil?
      redirect_to home_url
    else
      #call from ApplicationController for retrieve home data
      # retrievehome

      @m_channel = MChannel.find_by(id: params[:id])
    end
  end

  # PATCH/PUT /m_channels/1
  def update
    mChannel = MChannel.find_by(id: params[:id])
    if mChannel.nil?
      render json: @m_channel.errors, status: :unprocessable_entity
    else
      if @m_channel.channel_name == "" || @m_channel.channel_name.nil?
        render json: @m_channel.errors, status: :unprocessable_entity
      else
        mChannel.update(m_channel_params)
        # render json: { message: "Channel Update Successful" }, status: :ok
      end
    end
  end

  # DELETE /m_channels/1
  def destroy
    if MChannel.find_by(id: params[:id]).nil?
      render json: @m_channel.errors, status: :unprocessable_entity
    else
      group_messges = TGroupMessage.where(m_channel_id: params[:id])
      group_messges.each do|gmsg|
        gpthread=TGroupThread.select("id").where(t_group_message_id: gmsg.id)
        gpthread.each do|gpthread|
          TGroupStarThread.where(groupthreadid: gpthread.id).destroy_all
          TGroupMentionThread.where(groupthreadid: gpthread.id).destroy_all
          TGroupThread.find_by(id: gpthread.id).destroy
        end
        TGroupStarMsg.where(groupmsgid: gmsg.id).destroy_all
        TGroupMentionMsg.where(groupmsgid: gmsg.id).destroy_all
        TGroupMessage.find_by(id: gmsg.id).delete
      end
      TUserChannel.where(channelid: params[:id]).destroy_all
      MChannel.find_by(id: params[:id]).delete
      render json: { message: "User has been deleted" }, status: :ok
    end
    end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m_channel
      @m_channel = MChannel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def m_channel_params
      params.require(:m_channel).permit(:channel_status,:channel_name,:m_workspace_id,:user_id)
    end
end
