import 'dart:convert';

import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class MChannelServices {
  Future<void> createChannel(String channelName, int status) async {
    try {
      var token = await AuthController().getToken();
      int userId = SessionStore.sessionData!.currentUser!.id!.toInt();
      int workSpaceId = SessionStore.sessionData!.mWorkspace!.id!.toInt();

      Map<String, dynamic> requestBody = {
        "m_channel": {
          "user_id": userId,
          "channel_status": status,
          "channel_name": channelName,
          "m_workspace_id": workSpaceId
        }
      };

      final response = await http.post(
        Uri.parse("http://localhost:8001/m_channels"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        print('Channel created successfully!');
      } else if (response.statusCode == 422) {
        throw Exception('Failed to create Channel: Unprocessable Entity');
      } else {
        throw Exception('Failed to create Channel: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in createChannel: $e");
      throw e;
    }
  }

  Future<void> deleteChannel(int channelID) async {
    String url = 'http://localhost:8001/m_channels/$channelID';
    try {
      var token = await AuthController().getToken();

      await http.delete(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> updateChannel(
      int channelId, bool channelStatus, String channelName) async {
    String currentUser = SessionStore.sessionData!.currentUser!.name.toString();
    int workSpaceId = SessionStore.sessionData!.mWorkspace!.id!.toInt();
    String url = 'http://localhost:8001/m_channels/$channelId';
    Map<String, dynamic>? requestBody = {
      "m_channel": {
        "channel_status": channelStatus,
        "channel_name": channelName,
        "m_workspace_id": workSpaceId,
        "user_id": currentUser
      }
    };
    try {
      var token = await AuthController().getToken();
      final response = await http.patch(Uri.parse(url),
          headers: {
            'COntent-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(requestBody));
      if (response.statusCode == 204) {
        return 'Channel has been Updated';
      } else {
        return '$response.statusCode.toString()';
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> channelJoin(int channelId) async {
    var token = await AuthController().getToken();
    String url = "http://localhost:8001/channeluserjoin?channel_id=$channelId";
    try {
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        print("join channel has successful");
      } else {
        print("$response.statusCode");
      }
    } catch (e) {
      throw e;
    }
  }
}
