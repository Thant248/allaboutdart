import 'package:api_testing/controller/TodoController.dart';
import 'package:api_testing/model/Todo.dart';
import 'package:api_testing/repository/repository.dart';
import 'package:api_testing/repository/repositoryImpl.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = TodoController(RepositoryImpl());
    return Scaffold(
        appBar: AppBar(
          title: Text("Rest Api Demo"),
        ),
        body: FutureBuilder(
          future: controller.fetchTodoList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            return buildBodyContent(snapshot, controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Todo todo = Todo(userId: 3, title: 'sample post', completed: false);
            controller.postTodo(todo);
          },
          child: Icon(Icons.add),
        ));
  }

  SafeArea buildBodyContent(
      AsyncSnapshot<List<Todo>> snapshot, TodoController controller) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: (context, index) {
            var todo = snapshot.data?[index];
            print('coding');
            print(todo?.id);
            return Container(
              height: 100.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text('${todo?.id}')),
                  Expanded(flex: 3, child: Text('${todo?.title}')),
                  Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                controller.patchTodoList(todo!).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('$value')));
                                });
                              },
                              child:
                                  buildCallContainer('patch', Colors.orange)),
                          InkWell(
                              onTap: () {
                                controller.updatePatch(todo!);
                              },
                              child: buildCallContainer('put', Colors.orange)),
                          InkWell(
                              onTap: () {
                                controller.deletedMethod(todo!).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('$value')));
                                });
                              },
                              child:
                                  buildCallContainer('delete', Colors.orange)),
                        ],
                      )),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 0.5,
              height: 0.5,
            );
          },
          itemCount: snapshot.data?.length ?? 0),
    );
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Center(child: Text('$title')),
    );
  }
}
