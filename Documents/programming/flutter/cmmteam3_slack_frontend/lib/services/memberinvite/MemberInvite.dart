import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/services/memberinvite/member_invite_service.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class MemberInviteService {
  Future<void> memberInvite(String email, int channelID) async {
    final _apiService = MemberInviteServices(Dio());
    int workSpace = SessionStore.sessionData!.mWorkspace!.id!.toInt();
    try {
      var token = await AuthController().getToken();
      Map<String, dynamic> requestBody = {
        "m_invite": {
          "email": email,
          "channel_id": channelID,
          "workspace_id": workSpace
        }
      };
     await _apiService.memberinvite(token!, requestBody);  
    } catch (e) {
      throw e;
    }
  }
}
