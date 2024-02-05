import 'package:api_testing/model/Todo.dart';

abstract class PostRepo {
  Future<List<Todo>> getTodoList();
  Future<String> patchCompleted(Todo todo);
  Future<String> putCompleted(Todo todo);
  Future<String> deletedTodo(Todo todo);
  Future<String> postTodo(Todo todo);
}
