json arrays! @m_channels do |m_channel|
    json.id m_channel.id
    json.channel_name m_channel.channel_name
    json.channel_status m_channel.channel_status
    json.m_workspace m_channel.m_workspace
end
