import 'package:flutter_frontend/model/Unread_model.dart';

class UnreadMsg{
  List<Un_DirectMsg>? unreadDirectMsg;
  List<Un_G_message>? unreadGpMsg;
  List<Un_Thread>? unreadThreads;

  UnreadMsg({
    this.unreadDirectMsg,
    this.unreadGpMsg,
    this.unreadThreads
  });

  UnreadMsg.fromJson(Map<String,dynamic> json){
    if(json['t_direct_messages'] != null){
      unreadDirectMsg = <Un_DirectMsg>[];
      json['t_direct_messages'].forEach((v){
        unreadDirectMsg!.add(new Un_DirectMsg.fromJson(v));
      });
    }
    if(json['t_direct_threads'] != null){
      unreadThreads = <Un_Thread>[];
      json['t_direct_threads'].forEach((v){
        unreadThreads!.add(new Un_Thread.fromJson(v));
      });
    }
    if(json['t_group_messages'] != null){
      unreadGpMsg = <Un_G_message>[];
      json['t_group_messages'].forEach((v){
        unreadGpMsg!.add(new Un_G_message.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unreadDirectMsg != null) {
      data['t_direct_messages'] = this.unreadDirectMsg!.map((e) => e.toJson()).toList();
    }
    if (this.unreadThreads != null) {
      data['t_direct_threads'] = this.unreadThreads!.map((e)=>e.toJson()).toList();
    }
    if(this.unreadGpMsg != null){
      data['t_group_messages'] = this.unreadGpMsg!.map((e) => e.toJson()).toList();
    }
  
    return data;
  }
}