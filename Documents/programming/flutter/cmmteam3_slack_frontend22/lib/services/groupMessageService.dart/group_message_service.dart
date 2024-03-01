import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/groupMessage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}
Future<groupMessageData> fetchAlbum() async {  
  String? token = await getToken();
  // bool? isLoggedIn = await getLogin();
  if (token == null) {
    throw Exception('Token not available');
  }
  final response = await http.get(
    Uri.parse('http://127.0.0.1:8001/m_channels/5'),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    // List<dynamic> jsonList = jsonDecode(response.body);
    // List<groupMessageData> users = jsonList.map((json) => groupMessageData.fromJson(json)).toList();
    Map<String, dynamic> data = jsonDecode(response.body);
    groupMessageData groups = groupMessageData.fromJson(data); 
    print("users");
    print(groups);
    print(groups.runtimeType);
    return groups;
  } else {
    throw Exception('Failed to load userdata');
  }
}

Future<void> sendGroupMessageData(
    String groupMessage, int channelID) async {
  String? token = await getToken();
  if (token == null) {
    throw Exception('Token not available');
  }    
  print("groupMessage");
  print(groupMessage);
  print("channelID");
   print(channelID);
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8001/groupmsg'),
    headers:{
     'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(
      {
      "s_channel_id": channelID,
      "message": groupMessage
      }
    ),
   
  );
  print("response");
  print(response);

  if (response.statusCode == 200) {
    print("Send GroupMessage  Successfully");
  } else {
    print("Send GroupMessage fail");
  }
}
