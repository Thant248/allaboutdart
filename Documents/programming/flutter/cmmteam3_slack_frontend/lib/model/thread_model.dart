class dThread {
  // String? id;
  String? name;
  String? directthreadmsg;
  String? created_at;
  dThread(
      {
      //  this.id,
      this.directthreadmsg,
      this.name,
      this.created_at});
  dThread.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    directthreadmsg = json['directthreadmsg'];
    created_at = json['created_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['directthreadmsg'] = this.directthreadmsg;
    data['name'] = this.name;
    // data ['t_direct_message_id'] = this.t_direct_message_id;
    return data;
  }
}

class DirectMsg {
  String? created_at;
  String? directmsg;
  String? name;
  DirectMsg({this.created_at, this.directmsg, this.name});
  DirectMsg.fromJson(Map<String, dynamic> json) {
    created_at = json['created_at'];
    directmsg = json['directmsg'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['directmsg'] = this.directmsg;
    data['name'] = this.name;
    return data;
  }
}

class G_message {
  String? name;
  String? groupmsg;
  String? created_at;
  G_message({this.created_at, this.groupmsg, this.name});
  G_message.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    groupmsg = json['groupmsg'];
    created_at = json['created_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['groupmsg'] = this.groupmsg;
    data['created_at'] = this.created_at;
    return data;
  }
}

class G_thread {
  String? name;
  String? groupthreadmsg;
  String? created_at;
  G_thread({this.created_at, this.groupthreadmsg, this.name});
  G_thread.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    groupthreadmsg = json['groupthreadmsg'];
    created_at = json['created_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['groupthreadmsg'] = this.groupthreadmsg;
    data['created_at'] = this.created_at;
    return data;
  }
}
// class M_star {
//   String? mstar;
//   M_star({this.mstar});
//   M_star.fromJson(Map<String,dynamic> json){
//     mstar = json['t_direct_star_msgids'];
//   }
//   Map<String,dynamic> toJson(){
//     final Map<String,dynamic> data = new Map<String,dynamic>();
//     data['t_direct_star_msgids'] = this.mstar;
//     return data;
//   }
// }