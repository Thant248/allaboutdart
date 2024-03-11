class StarLists {
  List<DirectStar>? directStar;
  List<DirectStarThread>? directStarThread;
  List<GroupStar>? groupStar;
  List<GroupStarThread>? groupStarThread;

  StarLists(
      {this.directStar,
      this.directStarThread,
      this.groupStar,
      this.groupStarThread});

  StarLists.fromJson(Map<String, dynamic> json) {
    if (json['direct_Star'] != null) {
      directStar = <DirectStar>[];
      json['direct_Star'].forEach((v) {
        directStar!.add(new DirectStar.fromJson(v));
      });
    }
    if (json['direct_star_thread'] != null) {
      directStarThread = <DirectStarThread>[];
      json['direct_star_thread'].forEach((v) {
        directStarThread!.add(new DirectStarThread.fromJson(v));
      });
    }
    if (json['group_star'] != null) {
      groupStar = <GroupStar>[];
      json['group_star'].forEach((v) {
        groupStar!.add(new GroupStar.fromJson(v));
      });
    }
    if (json['group_star_thread'] != null) {
      groupStarThread = <GroupStarThread>[];
      json['group_star_thread'].forEach((v) {
        groupStarThread!.add(new GroupStarThread.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.directStar != null) {
      data['direct_Star'] = this.directStar!.map((v) => v.toJson()).toList();
    }
    if (this.directStarThread != null) {
      data['direct_star_thread'] =
          this.directStarThread!.map((v) => v.toJson()).toList();
    }
    if (this.groupStar != null) {
      data['group_star'] = this.groupStar!.map((v) => v.toJson()).toList();
    }
    if (this.groupStarThread != null) {
      data['group_star_thread'] =
          this.groupStarThread!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DirectStar {
  int? id;
  String? directmsg;
  DateTime? createdAt;
  String? name;

  DirectStar({this.id, this.directmsg, this.createdAt, this.name});

  DirectStar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    directmsg = json['directmsg'];
    createdAt = DateTime.parse(json['created_at']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['directmsg'] = this.directmsg;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    return data;
  }
}

class DirectStarThread {
  int? id;
  String? directthreadmsg;
  DateTime? createdAt;
  String? name;

  DirectStarThread({this.id, this.directthreadmsg, this.createdAt, this.name});

  DirectStarThread.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    directthreadmsg = json['directthreadmsg'];
    createdAt = DateTime.parse(json['created_at']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['directthreadmsg'] = this.directthreadmsg;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    return data;
  }
}

class GroupStar {
  int? id;
  String? groupmsg;
 DateTime? createdAt;
  String? name;
  String? channelName;

  GroupStar(
      {this.id, this.groupmsg, this.createdAt, this.name, this.channelName});

  GroupStar.fromJson(Map<String, dynamic> json) {
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
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['channel_name'] = this.channelName;
    return data;
  }
}

class GroupStarThread {
  int? id;
  String? groupthreadmsg;
  DateTime? createdAt;
  String? name;
  String? channelName;

  GroupStarThread(
      {this.id,
      this.groupthreadmsg,
      this.createdAt,
      this.name,
      this.channelName});

  GroupStarThread.fromJson(Map<String, dynamic> json) {
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
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['channel_name'] = this.channelName;
    return data;
  }
}
