import 'package:api_testing/model/Todo.dart';
import 'package:api_testing/repository/repository.dart';

class TodoController {
  final PostRepo _repo;

  TodoController(this._repo);

  Future<List<Todo>> fetchTodoList() async {
    var repo = _repo.getTodoList();
    return repo;
  }

  Future<String> patchTodoList(Todo todo) async {
    return _repo.patchCompleted(todo);
  }

  Future<String> updatePatch(Todo todo) async {
    return _repo.putCompleted(todo);
  }

  Future<String> deletedMethod(Todo todo) async {
    return _repo.deletedTodo(todo);
  }

  Future<String> postTodo(Todo todo) async {
    return _repo.postTodo(todo);
  }
}
