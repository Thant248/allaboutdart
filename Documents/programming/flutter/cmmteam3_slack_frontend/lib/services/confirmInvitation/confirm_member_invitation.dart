import 'package:dio/dio.dart';
import 'package:flutter_frontend/services/confirmInvitation/confirm_invitation_service.dart';

class MemberInvitation {
  final _apiService = ConfirmInvitationService(Dio());

  Future<String> memberInvitationConfirm(
      String password,
      String confirmPassword,
      String name,
      String email,
      String channelId,
      String workSpaceId) async {
    try {
      Map<String, dynamic> requestBody = {
        "m_user": {
          "remember_digest": workSpaceId,
          "profile_image": channelId,
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
          "admin": "0"
        }
      };
      await _apiService.invitationConfirm(requestBody);

      return 'member confirmation succesful';
    } catch (e) {
      throw e;
    }
  }
}
