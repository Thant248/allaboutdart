import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_frontend/model/dataInsert/thread_lists.dart';

class groupThread extends StatefulWidget {
  const groupThread({Key? key}) : super(key: key);

  @override
  State<groupThread> createState() => _groupThreadState();
}

class _groupThreadState extends State<groupThread> {
  var snapshot = ThreadStore.thread;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot!.groupThread!.length,
                          itemBuilder: (context, index) {
                            String g_thread = snapshot!
                                .groupThread![index].groupthreadmsg
                                .toString();
                            String g_thread_name =
                                snapshot!.groupThread![index].name.toString();
                            String g_thread_t = snapshot!
                                .groupThread![index].created_at
                                .toString();
                            DateTime time = DateTime.parse(g_thread_t);
                            String created_at =
                                DateFormat('yyyy-MM-dd HH:mm:ss').format(time);

                            return ListTile(
                              leading: Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(
                                    g_thread_name.characters.first,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ))),
                              title: Row(
                                children: [
                                  Text(
                                    g_thread_name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(created_at,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(143, 0, 0, 0)))
                                ],
                              ),
                              subtitle: Text(g_thread),
                            );
                          }),
                    ),
                  ],
                ))));
  }
}
