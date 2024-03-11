import 'package:dio/dio.dart';
import 'package:goroute/service/confirm_service.dart';

class ApiSerices {
  final _apiSerive = ConfirmService(Dio());

  Future<String> confirmUser(String password, String confirmPassword,
      String name, String email, String profileImage, String workspaceName) async {
    Map<String, dynamic> requestBody = {
      "m_user": {
        "remember_digest": workspaceName,
        "profile_image": profileImage,
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "admin": "0"
      }
    };

    try {
      await _apiSerive.confirmInvitation(requestBody);
      return 'successful';
    } catch (e) {
      throw e;
    }
  }
}
