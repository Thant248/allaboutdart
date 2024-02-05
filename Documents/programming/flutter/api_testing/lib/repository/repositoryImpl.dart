import 'package:api_testing/model/Todo.dart';
import 'package:api_testing/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepositoryImpl implements PostRepo {
  String baseURL = 'https://jsonplaceholder.typicode.com/';
  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);
    var body = json.decode(response.body);

    for (int i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }

  @override
  Future<String> deletedTodo(Todo todo) async {
    var url = Uri.parse('$baseURL/todos/${todo.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  @override
  Future<String> patchCompleted(Todo todo) async {
    var url = Uri.parse('$baseURL/todos/${todo.id}');
    String resData = '';

    await http.patch(url,
        body: {'completed': (todo.completed).toString()},
        headers: {'Authorization': 'your_token'}).then((value) {
      Map<String, dynamic> result = json.decode(value.body);
      print(result);
      return resData == result['completed'];
    });
    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) async {
    print('${todo.toJson()}');

    var url = Uri.parse('$baseURL/todos/');
    var result = '';
    var response = await http.post(url, body: todo.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    var url = Uri.parse('$baseURL/todos/${todo.id}');
    String resData = '';

    await http.patch(url,
        body: {'completed': (todo.completed).toString()},
        headers: {'Authorization': 'your_token'}).then((value) {
      Map<String, dynamic> result = json.decode(value.body);
      print(result);
      return resData == result['completed'];
    });
    return resData;
  }
}
