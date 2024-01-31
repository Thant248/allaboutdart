import 'package:json_demo/model/Todo.dart';

abstract class Repository {
  Future<List<Todo>> getTodoList();
  Future<String> patchComplete(Todo todo);
  Future<String> putcomplete(Todo todo);
  Future<String> deleteComplete(Todo todo);
  Future<String> postComplete(Todo todo);

}
