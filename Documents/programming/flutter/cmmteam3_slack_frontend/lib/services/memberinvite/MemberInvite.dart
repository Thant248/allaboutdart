import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:flutter_frontend/services/memberinvite/member_invite.dart';
import 'package:dio/dio.dart';

class MemberInviteServices{
  final _apiService = MemberInviteService(Dio());
  Future<void> memberInvite(String email, int channelID) async {
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
      await _apiService.memberinvitation(token!, requestBody);
     
     print('Member has been successfully invited!'); 
    } catch (e) {
      print("Error in createUser: $e");
      throw e;
    }
  }
}
