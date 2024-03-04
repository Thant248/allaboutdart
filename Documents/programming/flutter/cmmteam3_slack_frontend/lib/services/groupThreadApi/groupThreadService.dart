import 'dart:convert';

import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/group_thread_list.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class GpThreadMsg{
  Future<GroupThreadMessage> fetchGpThread(int id,int channelID) async {  
  var token = await AuthController().getToken();
  // bool? isLoggedIn = await getLogin();
  if (token == null) {
    throw Exception('Token not available');
  }
  final response = await http.get(
    Uri.parse(
    'http://localhost:8001/t_group_messages/${id}?s_channel_id=$channelID'),
    headers: <String, String>{
      'Content-Type':'application/json',
      'Authorization': 'Bearer $token',
    },
   
  );

  if (response.statusCode == 200) {
    // List<dynamic> jsonList = jsonDecode(response.body);
    // List<groupMessageData> users = jsonList.map((json) => groupMessageData.fromJson(json)).toList();
    final Map<String, dynamic> data = jsonDecode(response.body);
    GroupThreadMessage thread = GroupThreadMessage.fromJson(data); 
    print("users");
    print(thread.GpThreads![1].groupthreadmsg);
    return thread;
  } else {
    print("error");
    throw Exception('Failed to load userdata');
  }
}

Future<void> sendGroupThreadData (
    String groupMessage, int channelID,int messageID) async {
  var token = await AuthController().getToken();   
  int id = SessionStore.sessionData!.currentUser!.id!.toInt();
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8001/groupthreadmsg'),
    headers:{
     'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(
      {
      "s_group_message_id":messageID,
      "user_id":id,
      "s_channel_id": channelID,
      "message": groupMessage
      }
    ),
   
  );

  if (response.statusCode == 200) {
    print("Send GroupThread  Successfully");
  } else {
    print("Send GroupThread fail");
  }
}
}