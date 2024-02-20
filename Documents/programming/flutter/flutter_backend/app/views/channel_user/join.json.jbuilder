json.t_user_channel do
    json.id @t_user_channel.id
    json.message_count @t_user_channel.message_count
    json.unread_channel_message @t_user_channel.unread_channel_message
    json.created_admin @t_user_channel.created_admin
    json.userid @t_user_channel.userid
    json.channelid @t_user_channel.channelid
    json.created_at @t_user_channel.created_at
    json.updated_at @t_user_channel.updated_at
end