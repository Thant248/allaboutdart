import 'dart:convert';
import 'dart:html';

import 'package:json_demo/model/Todo.dart';
import 'package:json_demo/repository/repository.dart';
import 'package:http/http.dart' as http;

class TodoRepository extends Repository {
  String baseUrl = "https://jsonplaceholder.typicode.com";
  @override
  Future<String> deleteComplete(Todo todo) {
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> list = [];
    var url = Uri.parse("$baseUrl/posts");
    var response = await http.get(url);
    print("Status code ${response.statusCode}");
    var body = json.decode(response.body);
    for (int i = 0; i < body.length; i++) {
      list.add(Todo.fromJson(body[i]));
    }
    return list;
    
  }

  @override
  Future<String> patchComplete(Todo todo) {
    throw UnimplementedError();
  }

  @override
  Future<String> postComplete(Todo todo) {
    throw UnimplementedError();
  }

  @override
  Future<String> putcomplete(Todo todo) {
    throw UnimplementedError();
  }
}
