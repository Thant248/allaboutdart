class UserManageController < ApplicationController
    def usermanage
      @workspaceid = params[:workspace_id]
      @userid = params[:user_id]
      #check unlogin user
      # checkuser
  
      # session.delete(:s_user_id)
      # session.delete(:s_channel_id)
      # session.delete(:s_direct_message_id)
      # session.delete(:s_group_message_id)
      # session.delete(:r_direct_size)
      # session.delete(:r_group_size)
  
      @user_manages_activate = MUser.select("m_users.id,name,email,member_status").joins("join t_user_workspaces on t_user_workspaces.id = m_users.id")
      .where("t_user_workspaces.id = m_users.id and admin <> 1 and member_status = 1 and t_user_workspaces.workspaceid = ?",@workspaceid)
  
      @user_manages_deactivate = MUser.select("m_users.id,name,email,member_status").joins("join t_user_workspaces on t_user_workspaces.id = m_users.id")
      .where("t_user_workspaces.id = m_users.id and admin <> 1 and member_status = 0 and t_user_workspaces.workspaceid = ?",@workspaceid)
  
      @user_manages_admin = MUser.select("m_users.id,name,email").joins("join t_user_workspaces on t_user_workspaces.id = m_users.id")
      .where("t_user_workspaces.id = m_users.id and m_users.admin = 1 and t_user_workspaces.workspaceid = ?",@workspaceid)
  
      #call from ApplicationController for retrieve home data
      # retrievehome
       retrievehome
    end
end
