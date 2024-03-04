import 'dart:convert';
import 'dart:core';
import 'package:flutter_frontend/model/SessionState.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/Thread.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:http/http.dart' as http;
class threadApi{
  Future<Threads>? threadList() async {
    var token = await AuthController().getToken();
    int id = SessionStore.sessionData!.currentUser!.id!.toInt();
    final url = 'http://localhost:8001/thread?user_id=${id}';
    try{
      final Response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type':'application/json',
          'Authorization':'Bearer $token'
        },
        );
        if(Response.statusCode==200){
          final Map<String,dynamic> data = jsonDecode(Response.body);
          Threads threads = Threads.fromJson(data);
          print(threads);
          return threads;
        }else{
          throw Exception('data is not found');
        }
    }
    catch (e){
      throw Exception(e);
    }
  }
}





