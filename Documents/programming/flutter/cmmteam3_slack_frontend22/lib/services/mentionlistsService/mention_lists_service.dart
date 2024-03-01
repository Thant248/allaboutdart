import 'dart:convert';

import 'package:flutter_frontend/model/MentionLists.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;

class MentionListsService {
  Future<MentionLists>? mentionList() async {
     var token = await AuthController().getToken();
    int id = 2;
    final url = 'http://localhost:8001/mentionlists?user_id=$id';
    try {
      final response  = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if(response.statusCode == 200){
        final Map<String, dynamic> data=jsonDecode(response.body);
        MentionLists mentionLists = MentionLists.fromJson(data);
        return mentionLists;
      }else {
        throw Exception('data not found');
      }
    }catch(e){
      throw Exception(e);
    }

  }
}