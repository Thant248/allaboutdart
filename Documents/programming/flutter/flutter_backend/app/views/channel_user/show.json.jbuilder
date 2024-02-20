json.s_channel do
    json.id @s_channel.id
    json.channel_name @s_channel.channel_name
    json.channel_status @s_channel.channel_status
    json.m_workspace_id @s_channel.m_workspace_id
    json.created_at @s_channel.created_at
    json.updated_at @s_channel.updated_at
end
json.c_users_id @c_users_id
