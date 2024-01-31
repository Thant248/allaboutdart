import 'package:json_demo/model/Todo.dart';
import 'package:json_demo/repository/todoRepository.dart';

class TodoController {
  TodoRepository _repo;

  TodoController(this._repo);

  Future<List<Todo>> fetchTodoList() async {
    return _repo.getTodoList();
  }
}
