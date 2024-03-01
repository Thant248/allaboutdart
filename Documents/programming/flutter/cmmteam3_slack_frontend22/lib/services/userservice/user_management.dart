import 'dart:convert';

import 'package:flutter_frontend/model/dataInsert/user_management_store.dart';
import 'package:flutter_frontend/model/user_management.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class UserManagementService {
  Future<String> deactivateUser(int userId) async {
    String url = "http://127.0.0.1:8001/update?id=$userId";
    var token = await AuthController().getToken();
    try {
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        return 'successful';
      }
    } catch (e) {
      return e.toString();
    }
    return '';
  }

  Future<UserManagement> getAllUsers() async {
    String url = "http://127.0.0.1:8001/usermanage";
    var token = await AuthController().getToken();

    try {
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        UserManagement userManagement = UserManagement.fromJson(data);
        UserManagementStore.userManagement = userManagement;
        final user = UserManagementStore.userManagement;

        return userManagement;
      } else {
        throw Exception(
            "Failed to fetch session data: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
