import 'package:flutter_frontend/model/SessionState.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future<String> loginUser(
      String name, String password, String workspaceName) async {
    final url = 'http://127.0.0.1:8001/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "user": {
            "name": name,
            "password": password,
            "workspace_name": workspaceName
          }
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String token = data['token'];
        await saveToken(token.toString());
        // await mainPage();
        print(token);
        return token;
      } else {
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
        throw Exception(
            "Failed to login: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error in loginUser: $e");
      throw e;
    }
  }

  Future<SessionData> mainPage() async {
    String url = 'http://127.0.0.1:8001/main';
    var token = await getToken();
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        SessionData sessionData = SessionData.fromJson(data);
        SessionStore.sessionData = sessionData;

        return sessionData;
      } else {
       
        throw Exception(
            "Failed to fetch session data: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e){
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
    var url = "http://127.0.0.1:8001/m_users";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "m_user": {
            "remember_digest": workspaceName,
            "profile_image": channelName,
            "name": name,
            "email": email,
            "password": password,
            "password_confirmation": confirmPassword,
            "admin": "1"
          }
        }),
      );

      if (response.statusCode == 201) {
        print('User created successfully!');
      } else if (response.statusCode == 422) {
        throw Exception('Failed to create user. Email is already taken');
      } else {
        throw Exception('Failed to create user.');
      }
    } catch (e) {
      print("Error in createUser: $e");
      throw e;
    }
  }

  Future<void> changePassword(String password, String confirmPassword) async {
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    String url = "http://127.0.0.1:8001/m_users/$currentUserId";
    Map<String, dynamic> requestBody = {
      "m_user": {"password": password, "password_confirmation": confirmPassword}
    };
    try {
      var token = await AuthController().getToken();
      var response = await http.patch(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(requestBody));

      if (response.statusCode == 201) {
      } else if (response.statusCode != 200) {
      } else {}
    } catch (e) {}
  }
}
