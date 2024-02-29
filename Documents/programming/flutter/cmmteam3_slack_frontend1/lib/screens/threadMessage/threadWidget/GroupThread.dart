import 'package:flutter/material.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/threads/thread_api.dart';
import 'package:intl/intl.dart';

class groupThread extends StatefulWidget {
  const groupThread({Key? key}) : super(key: key);

  @override
  State<groupThread> createState() => _groupThreadState();
}

class _groupThreadState extends State<groupThread> {
  threadApi ThreadApi = threadApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: ThreadApi.threadList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressionBar(
                  imageName: 'loading.json',
                  height: 200,
                  size: 200,
                );
              } else if (snapshot.hasError) {
                return const ProgressionBar(
                    imageName: 'dataSending.json', height: 200, size: 200);
              } else if (snapshot.data == null ||
                  snapshot.data!.d_thread == null ||
                  snapshot.data!.d_thread!.isEmpty) {
                return const ProgressionBar(
                  imageName: 'nodatahasFounded.json',
                  height: 200,
                  size: 200,
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.groupThread!.length,
                          itemBuilder: (context, index) {
                            String g_thread = snapshot
                                .data!.groupThread![index].groupthreadmsg
                                .toString();
                            String g_thread_name = snapshot
                                .data!.groupThread![index].name
                                .toString();
                            String g_thread_t = snapshot
                                .data!.groupThread![index].created_at
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
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ))),
                              title: Row(
                                children: [
                                  Text(
                                    g_thread_name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(created_at,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(143, 0, 0, 0)))
                                ],
                              ),
                              subtitle: Text(g_thread),
                            );
                          }),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
