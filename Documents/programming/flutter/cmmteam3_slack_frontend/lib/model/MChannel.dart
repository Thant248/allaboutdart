class MChannel {
  int? userId;
  int? channelStatus;
  String? channelName;
  int? mWorkspaceId;

  MChannel(
      {this.userId, this.channelStatus, this.channelName, this.mWorkspaceId});

  MChannel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    channelStatus = json['channel_status'];
    channelName = json['channel_name'];
    mWorkspaceId = json['m_workspace_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['channel_status'] = this.channelStatus;
    data['channel_name'] = this.channelName;
    data['m_workspace_id'] = this.mWorkspaceId;
    return data;
  }
}
