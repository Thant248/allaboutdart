import 'dart:async';
import 'dart:convert';

import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class DirectMessageService {
  late StreamController<DirectMessages> _controller;

  Stream<DirectMessages> getAllDirectMessages(int userId) async* {
    _controller = StreamController<DirectMessages>();

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
        _controller.add(directMessage);
        print("email");
        print(directMessage.mUser!.email.toString());
      } else {
        print("Direct Messages Data has not been found");
        _controller.addError(
            "Failed to fetch session data: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print(e);
      _controller.addError(e);
    } finally {
      _controller.close(); // Close the stream after all events have been added
    }

    yield* _controller.stream;
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
