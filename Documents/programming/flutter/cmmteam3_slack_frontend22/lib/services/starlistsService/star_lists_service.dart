// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:flutter_frontend/model/StarLists.dart';
import 'package:flutter_frontend/model/dataInsert/star_list.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_frontend/model/SessionStore.dart';


class StarListService {
  Future<StarLists>? starList() async {
    var token = await AuthController().getToken();
    int userId = SessionStore.sessionData!.currentUser!.id!.toInt();
    final url = 'http://localhost:8001/starlists?user_id=${userId}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        StarLists starLists = StarLists.fromJson(data);
        StarListStore.starList = starLists;
        return starLists;
      } else {
        print("Error");
        throw Exception('direct_Star data not found or invalid format');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
