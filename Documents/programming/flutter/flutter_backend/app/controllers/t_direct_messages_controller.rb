#Slack System
#Direct Message Controller 
#Authorname-KyawSanWin@CyberMissions Myanmar Company limited 
#@Since 27/06/2019
#Version 1.0.0

class TDirectMessagesController < ApplicationController
  def show
    #check unlogin user
    # checkuser
    @direct_message_id = params[:directMessage_id]
    # @receiverUserID = params[:s_user_id]
    # @senderID = params [:user_id]
    # session[:s_direct_message_id] =  params[:id]
    #call from ApplicationController for retrieve direct thread data
    retrieve_direct_thread(@direct_message_id)
    #call from ApplicationController for retrieve home data
    # retrievehome
  end
end
