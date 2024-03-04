import 'dart:convert';

import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class MemberInviteService {
  Future<void> memberInvite(String email, int channelID) async {
    final url = 'http://127.0.0.1:8001/memberinvite';
   
    int workSpace = SessionStore.sessionData!.mWorkspace!.id!.toInt();
    try {
      var token = await AuthController().getToken();
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode({
            "m_invite": {
              "email": email,
              "channel_id": channelID,
              "workspace_id": workSpace
            }
          }));
      if (response.statusCode == 200) {
        print('Member has been successfully invited!');
      } else if (response.statusCode == 422) {
        throw Exception('Failed to invite member. member is already there');
      } else {
        throw Exception('Failed to invite Member .');
      }
    } catch (e) {
      print("Error in createUser: $e");
      throw e;
    }
  }
}
