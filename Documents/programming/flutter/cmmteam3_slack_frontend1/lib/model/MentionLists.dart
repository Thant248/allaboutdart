class MentionLists {
  List<GroupMessage>? groupMessage;
  List<GroupThread>? groupThread;

  MentionLists (
    { 
      this.groupMessage,
      this.groupThread});
  
  MentionLists.fromJson(Map<String, dynamic> json){
    if(json['t_group_messages'] != null){
      groupMessage = <GroupMessage>[];
      json['t_group_messages'].forEach((e){
        groupMessage!.add(new GroupMessage.fromJson(e));

      });
    }
    if(json['t_group_threads'] != null){
      groupThread = <GroupThread>[];
      json['t_group_threads'].forEach((e){
        groupThread!.add(new GroupThread.fromJson(e));

      });
    }
  }
  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.groupMessage != null){
      data['t_group_messages'] = this.groupMessage!.map((e) => e.toJson()).toList();
    }
    if(this.groupThread != null){
      data['t_group_threads'] = this.groupThread!.map((e) => e.toJson()).toList();
    }
    return data;
  }  
}
  class GroupMessage {
  int? id;
  String? groupmsg;
  DateTime? createdAt;
  String? name;
  String? channelName;

  GroupMessage({this.id, this.groupmsg, this.createdAt, this.name,this.channelName});

  GroupMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupmsg = json['groupmsg'];
    createdAt = DateTime.parse(json['created_at']);
    name = json['name'];
    channelName = json['channel_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupmsg'] = this.groupmsg;
    data['created_at'] = createdAt;
    data['name'] = this.name;
    data['channel_name'] = this.channelName;
    return data;
  }
}


class GroupThread {
  int? id;
  String? groupthreadmsg;
  DateTime? createdAt;
  String? name;
  String? channelName;

  GroupThread({this.id, this.groupthreadmsg, this.createdAt, this.name,this.channelName});

  GroupThread.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupthreadmsg = json['groupthreadmsg'];
    createdAt = DateTime.parse(json['created_at']);
    name = json['name'];
    channelName = json['channel_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupthreadmsg'] = this.groupthreadmsg;
    data['created_at'] = createdAt;
    data['name'] = this.name;
    data['channel_name'] = this.channelName;
    return data;
  }
}
