import 'dart:convert';

import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/services/mChannelService/m_channel_service.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class MChannelServices {
  final _apiService = MChannelService(Dio());
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
      await _apiService.createMChannel(requestBody, token!);
    } catch (e) {
      print("Error in createChannel: $e");
      throw e;
    }
  }

  Future<void> deleteChannel(int channelID) async {
    try {
      var token = await AuthController().getToken();
      await _apiService.deleteChannel(channelID, token!);
    } catch (e) {
      throw e;
    }
  }

  Future<String> updateChannel(
      int channelId, bool channelStatus, String channelName) async {
    String currentUser = SessionStore.sessionData!.currentUser!.name.toString();
    int workSpaceId = SessionStore.sessionData!.mWorkspace!.id!.toInt();

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
      await _apiService.updateChannel(channelId, requestBody, token!);
      return 'Channel has Been Update';
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> channelJoin(int channelId) async {
    var token = await AuthController().getToken();
    try {
      _apiService.joinChannel(channelId, token!);
    } catch (e) {
      throw e;
    }
  }
}
