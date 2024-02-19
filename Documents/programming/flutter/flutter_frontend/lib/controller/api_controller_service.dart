import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future<void> loginUser(
      String name, String password, String workspaceName) async {
    final url = 'http://127.0.0.1:8001/login';
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
      print(data);
      saveToken(data.toString());
     
    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
    }
  }
}

Future<void> saveToken(String token) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setString('jwt-token', token);
}
