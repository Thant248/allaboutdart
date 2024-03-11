class DirectMessageThread {
  TDirectMessage? tDirectMessage;
  List<TDirectThreads>? tDirectThreads;
  List<int>? tDirectStarThreadMsgids;

  DirectMessageThread(
      {this.tDirectMessage, this.tDirectThreads, this.tDirectStarThreadMsgids});

  DirectMessageThread.fromJson(Map<String, dynamic> json) {
    tDirectMessage = json['t_direct_message'] != null
        ? new TDirectMessage.fromJson(json['t_direct_message'])
        : null;
    if (json['t_direct_threads'] != null) {
      tDirectThreads = <TDirectThreads>[];
      json['t_direct_threads'].forEach((v) {
        tDirectThreads!.add(new TDirectThreads.fromJson(v));
      });
    }
    tDirectStarThreadMsgids = json['t_direct_star_thread_msgids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tDirectMessage != null) {
      data['t_direct_message'] = this.tDirectMessage!.toJson();
    }
    if (this.tDirectThreads != null) {
      data['t_direct_threads'] =
          this.tDirectThreads!.map((v) => v.toJson()).toList();
    }
    data['t_direct_star_thread_msgids'] = this.tDirectStarThreadMsgids;
    return data;
  }
}

class TDirectMessage {
  int? id;
  String? directmsg;
  bool? readStatus;
  int? sendUserId;
  int? receiveUserId;
  String? createdAt;
  String? updatedAt;

  TDirectMessage(
      {this.id,
      this.directmsg,
      this.readStatus,
      this.sendUserId,
      this.receiveUserId,
      this.createdAt,
      this.updatedAt});

  TDirectMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    directmsg = json['directmsg'];
    readStatus = json['read_status'];
    sendUserId = json['send_user_id'];
    receiveUserId = json['receive_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['directmsg'] = this.directmsg;
    data['read_status'] = this.readStatus;
    data['send_user_id'] = this.sendUserId;
    data['receive_user_id'] = this.receiveUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TDirectThreads {
  String? name;
  String? directthreadmsg;
  int? id;
  String? createdAt;

  TDirectThreads({this.name, this.directthreadmsg, this.id, this.createdAt});

  TDirectThreads.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    directthreadmsg = json['directthreadmsg'];
    id = json['id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['directthreadmsg'] = this.directthreadmsg;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    return data;
  }
}
