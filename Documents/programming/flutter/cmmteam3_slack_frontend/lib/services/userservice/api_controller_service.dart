import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/services/userservice/api_controller_services.dart';
import 'package:flutter_frontend/services/userservice/create_changepassword/login_change_service.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future<String> loginUser(
      String name, String password, String workspaceName) async {
    final apiService = LoginService(Dio());
    try {
      var response = await apiService.loginUser(({
        "user": {
          "name": name,
          "password": password,
          "workspace_name": workspaceName
        }
      }));
      final Map<String, dynamic> data = json.decode(response);
      final String token = data['token'];
      await saveToken(token.toString());
      print('printing');
      print(token);
      return token;
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
  }

  Future<void> removeToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
  }

  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } catch (e) {
      print("Error in getToken: $e");
      return null;
    }
  }

  Future<dynamic> createUser(
    String workspaceName,
    String channelName,
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final _apiService = MuserService(Dio());

    try {
      await _apiService.createUser(({
        "m_user": {
          "remember_digest": workspaceName,
          "profile_image": channelName,
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
          "admin": "1"
        }
      }));
    } catch (e) {
      print("Error in createUser: $e");
      throw e;
    }
  }

  Future<void> changePassword(String password, String confirmPassword) async {
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    final _apiService = MuserService(Dio());
    Map<String, dynamic> requestBody = {
      "m_user": {"password": password, "password_confirmation": confirmPassword}
    };
    try {
      var token = await AuthController().getToken();

      await _apiService.changePassword(currentUserId, requestBody, token!);
    } catch (e) {
      print("Error in createUser: $e");
      throw e;
    }
  }
}
