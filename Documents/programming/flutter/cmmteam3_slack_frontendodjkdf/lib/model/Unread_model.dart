class Un_Thread {
  String? name;
  String? directthreadmsg;
   String? created_at;
   Un_Thread({
     this.directthreadmsg,
     this.name,
     this.created_at
  });
   Un_Thread.fromJson(Map<String,dynamic> json){
    name  = json ['name'];
    directthreadmsg = json['directthreadmsg'];
    created_at  = json ['created_at'];
   }
   Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['created_at'] = this.created_at;
    data['directthreadmsg'] = this.directthreadmsg;
    data ['name'] = this.name;
    return data;
   }
}
class Un_DirectMsg {
  String? created_at;
  String? directmsg;
  String? name;
   Un_DirectMsg({
     this.created_at,
     this.directmsg,
     this.name
  });
   Un_DirectMsg.fromJson(Map<String,dynamic> json){
    created_at = json['created_at'];
    directmsg = json['directmsg'];
    name  = json ['name'];
   }
   Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['created_at'] = this.created_at;
    data['directmsg'] = this.directmsg;
    data ['name'] = this.name;
    return data;
   }
}
class Un_G_message{
  String? name;
  String? channel_name;
  String? groupmsg;
  String? created_at;
  Un_G_message({
    this.channel_name,
    this.created_at,
    this.groupmsg,
    this.name
  });
  Un_G_message.fromJson(Map<String,dynamic> json){
    name = json['name'];
    groupmsg = json['groupmsg'];
    created_at = json['created_at'];
    channel_name = json['channel_name'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['name'] = this.name;
    data['groupmsg'] = this.groupmsg;
    data['created_at'] = this.created_at;
    data['channel_name'] = this.channel_name;
    return data;
  }
}