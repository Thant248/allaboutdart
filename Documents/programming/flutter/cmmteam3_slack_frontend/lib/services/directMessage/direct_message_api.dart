import 'dart:async';
import 'dart:convert';

import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class DirectMessageService {
  Future<DirectMessages> getAllDirectMessages(int userId) async {
    final String url = "http://localhost:8001/show/$userId";

    try {
      final token = await AuthController().getToken();
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        DirectMessages directMessage = DirectMessages.fromJson(data);
        return directMessage;
      } else {
        throw Exception('message not founded');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> sendDirectMessage(int receiverUserId, String message) async {
    String url = "http://127.0.0.1:8001/directmsg";
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    Map<String, dynamic> requestBody = {
      "message": message,
      "user_id": currentUserId,
      "s_user_id": receiverUserId
    };

    try {
      var token = await AuthController().getToken();
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(requestBody));
      if (response.statusCode == 200) {
        print('message has been sent successfully');
      } else {
        print('${response.statusCode}');
      }
    } catch (e) {
      print('error');
    }
  }

  Future<void> sendDirectMessageThread(
      int directMsgId, int receiveUserId, String message) async {
    String url = "http://127.0.0.1:8001/directthreadmsg";
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    Map<String, dynamic> requestBody = {
      "s_direct_message_id": directMsgId,
      "s_user_id": receiveUserId,
      "message": message,
      "user_id": currentUserId
    };
    try {
      var token = await AuthController().getToken();
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(requestBody));
      if (response.statusCode == 200) {
        print('message has been sent successfully');
      } else {
        print('${response.statusCode}');
      }
    } catch (e) {
      print('error');
    }
  }

  Future<void> directStarMsg(int receiveUserId, int messageId) async {
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    String url =
        "http://127.0.0.1:8001/star?user_id=$currentUserId?id=$messageId?s_user_id=$receiveUserId";

    try {
      var token = await AuthController().getToken();
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        print('message has been sent successfully');
      } else {
        print('${response.statusCode}');
      }
    } catch (e) {
      print('error');
    }
  }
}
