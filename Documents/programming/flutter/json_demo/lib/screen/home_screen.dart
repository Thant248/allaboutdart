import 'package:flutter/material.dart';
import 'package:json_demo/controller/todo_controller.dart';
import 'package:json_demo/model/Todo.dart';
import 'package:json_demo/repository/todoRepository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepository());

    return Scaffold(
      appBar: AppBar(title: const Text("RestApiTest")),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              var todo = snapshot.data?[index];
              return Container(
                height: 100.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Row(
                  children: [
                      Expanded( flex:  1,child: Text("${}")),
                      Expanded( flex:  3,child: Text("1")),
                      Expanded( flex:  3,child: Text("1")),
                     
                  ],
                ),
              ); // You should return a widget here based on your data
            },
            separatorBuilder: (context, index) {
              return const Divider(thickness: 0.5, height: 0.5);
            },
            itemCount: snapshot.data?.length ?? 0,
          );
        },
      ),
    );
  }
}
