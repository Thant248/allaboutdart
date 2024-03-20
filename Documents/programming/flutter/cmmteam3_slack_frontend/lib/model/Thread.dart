
import 'package:flutter_frontend/model/star_lists_model.dart';
import 'package:flutter_frontend/model/thread_model.dart';

class Threads {
  List<DirectMsg>? directMsg;
  List<dThread>? d_thread;
  List<G_message>? groupMessage;
  List<G_thread>? groupThread;
  // List<dynamic>? d_message_star;
  // int? d_thread_star;
  Threads({this.d_thread, this.directMsg, this.groupMessage, this.groupThread
      // this.d_message_star,
      // this.d_thread_star
      });
  Threads.fromJson(Map<String, dynamic> json) {
    if (json['t_direct_messages'] != null) {
      directMsg = <DirectMsg>[];
      json['t_direct_messages'].forEach((v) {
        directMsg!.add(new DirectMsg.fromJson(v));
      });
    }
    if (json['t_direct_threads'] != null) {
      d_thread = <dThread>[];
      json['t_direct_threads'].forEach((v) {
        d_thread!.add(new dThread.fromJson(v));
      });
    }
    if (json['t_group_messages'] != null) {
      groupMessage = <G_message>[];
      json['t_group_messages'].forEach((v) {
        groupMessage!.add(new G_message.fromJson(v));
      });
    }
    if (json['t_group_threads'] != null) {
      groupThread = <G_thread>[];
      json['t_group_threads'].forEach((e) {
        groupThread!.add(new G_thread.fromJson(e));
      });
    }
    //  d_message_star = json['t_direct_star_msgids'];
    // d_thread_star = json['t_direct_star_thread_msgids'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.directMsg != null) {
      data['t_direct_messages'] =
          this.directMsg!.map((e) => e.toJson()).toList();
    }
    if (this.d_thread != null) {
      data['t_direct_threads'] = this.d_thread!.map((e) => e.toJson()).toList();
    }
    if (this.groupMessage != null) {
      data['t_group_messages'] =
          this.groupMessage!.map((e) => e.toJson()).toList();
    }
    if (this.groupThread != null) {
      data['t_group_threads'] =
          this.groupThread!.map((e) => e.toJson()).toList();
    }
    //  data['t_direct_star_msgids'] = this.d_message_star;
    // data['t_direct_star_thread_msgids'] = this.d_thread_star;
    return data;
  }
}
