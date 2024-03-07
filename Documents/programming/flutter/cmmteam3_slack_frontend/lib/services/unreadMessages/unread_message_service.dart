import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/UnreadMsg.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class UnreadApi {
  Future<UnreadMsg> unreadList() async {
    var token = await AuthController().getToken();
    int id = SessionStore.sessionData!.currentUser!.id!.toInt();
    final url = 'http://localhost:8001/allunread?user_id=${id}';
    try {
      final Response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (Response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(Response.body);
        UnreadMsg unreadmessage = UnreadMsg.fromJson(data);
        return unreadmessage;
      } else {
        throw Exception('data is not found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
