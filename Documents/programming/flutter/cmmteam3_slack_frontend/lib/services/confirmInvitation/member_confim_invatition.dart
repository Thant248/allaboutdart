import 'package:dio/dio.dart';
import 'package:flutter_frontend/services/confirmInvitation/member_confirm_service.dart';

class MemberConfirmInvitation {
  final _apiSerivce = MemberInvitationService(Dio());

  Future<String> memberInvitationConfir(String password, String confirmPassword,
      String name, int channelId, int workspaceId, String email) async {
    Map<String, dynamic> requestBody = {
      "m_user": {
        "remember_digest": workspaceId,
        "profile_image": channelId,
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "admin": "0"
      }
    };

    try {
      await _apiSerivce.confirmInvitation(requestBody);
      return 'successful';
    } catch (e) {
      throw e;
    }
  }
}
