# app/views/thread/show.json.jbuilder

json.t_direct_messages @t_direct_messages do |t_direct_message|
    json.id t_direct_message.id
    json.name t_direct_message.name
    json.directmsg t_direct_message.directmsg
    json.created_at t_direct_message.created_at
  end
  
  json.t_direct_threads @t_direct_threads do |t_direct_thread|
    json.id t_direct_thread.id
    json.name t_direct_thread.name
    json.directthreadmsg t_direct_thread.directthreadmsg
    json.t_direct_message_id t_direct_thread.t_direct_message_id
    json.created_at t_direct_thread.created_at
  end
  
  json.t_group_messages @t_group_messages do |t_group_message|
    json.id t_group_message.id
    json.name t_group_message.name
    json.groupmsg t_group_message.groupmsg
    json.created_at t_group_message.created_at
  end
  
  json.t_group_threads @t_group_threads do |t_group_thread|
    json.id t_group_thread.id
    json.name t_group_thread.name
    json.groupthreadmsg t_group_thread.groupthreadmsg
    json.t_group_message_id t_group_thread.t_group_message_id
    json.created_at t_group_thread.created_at
  end
  
  json.t_direct_star_thread_msgids @t_direct_star_thread_msgids
  json.t_direct_star_msgids @t_direct_star_msgids
  json.t_group_star_msgids @t_group_star_msgids
  json.t_group_star_thread_msgids @t_group_star_thread_msgids
  