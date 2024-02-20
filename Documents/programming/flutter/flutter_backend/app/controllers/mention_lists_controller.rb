
#Slack System
#Direct Message Controller 
#Authorname-AyeMyatHnin, HninWaiLwin@CyberMissions Myanmar Company limited 
#@Since 27/06/2019
#Version 1.0.0

class MentionListsController < ApplicationController
  def show
    #check login user
    # checkuser
    
    # session.delete(:s_user_id)
    # session.delete(:s_channel_id)
    # session.delete(:s_direct_message_id)
    # session.delete(:s_group_message_id)
    # session.delete(:r_direct_size)
    # session.delete(:r_group_size)
    
    @t_group_messages = TGroupMessage.select("t_group_messages.id,t_group_messages.groupmsg,t_group_messages.created_at,m_users.name,m_channels.channel_name")
                                            .joins("INNER JOIN t_group_mention_msgs ON t_group_messages.id=t_group_mention_msgs.groupmsgid
                                            INNER JOIN m_users ON  t_group_messages.m_user_id=m_users.id
                                            INNER JOIN m_channels ON t_group_messages.m_channel_id = m_channels.id")
                                            .where("t_group_mention_msgs.userid=?",params[:user_id]).order(id: :asc)
        

    @t_group_threads = TGroupThread.select("t_group_threads.id,t_group_threads.groupthreadmsg,t_group_threads.created_at,m_users.name,m_channels.channel_name") 
                                        .joins("INNER JOIN t_group_mention_threads ON t_group_threads.id=t_group_mention_threads.groupthreadid
                                         INNER JOIN t_group_messages ON t_group_messages.id=t_group_threads.t_group_message_id
                                         INNER JOIN m_users ON m_users.id=t_group_threads.m_user_id
                                         INNER JOIN m_channels ON t_group_messages.m_channel_id = m_channels.id")            
                                         .where("t_group_mention_threads.userid=?",params[:user_id]).order(id: :asc)

    @temp_group_star_msgids = TGroupStarMsg.select("groupmsgid").where("userid = ?", params[:user_id])

    @t_group_star_msgids = Array.new
    @temp_group_star_msgids.each { |r| @t_group_star_msgids.push(r.groupmsgid) }

    @temp_group_star_thread_msgids = TGroupStarThread.select("groupthreadid").where("userid = ?", params[:user_id])

    @t_group_star_thread_msgids = Array.new
    @temp_group_star_thread_msgids.each { |r| @t_group_star_thread_msgids.push(r.groupthreadid) }

    
    #call from ApplicationController for retrieve home data
    # retrievehome
  end
end