if @user_manages_activate
  json.user_manages_activate @user_manages_activate
end

if @user_manages_deactivate
  json.user_manages_deactivate @user_manages_deactivate
end

if @user_manages_admin
  json.user_manages_admin @user_manages_admin
end

json.m_workspace @m_workspace
json.m_users @m_users
json.m_channels @m_channels
json.m_p_channels @m_p_channels
json.direct_msgcounts @direct_msgcounts
json.all_unread_count @all_unread_count
json.m_channelsids @m_channelsids
