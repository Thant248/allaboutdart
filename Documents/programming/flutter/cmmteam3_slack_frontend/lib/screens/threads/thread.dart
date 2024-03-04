import 'package:flutter/material.dart';
import 'package:flutter_frontend/screens/threads/thread_api.dart';

class ThreadList extends StatelessWidget {
  const ThreadList({super.key});

  @override
  Widget build(BuildContext context) {
    threadApi ThreadApi = threadApi();
    return Scaffold(
      backgroundColor: const Color(0xFF92AFE6),
      appBar: AppBar(
        backgroundColor: Color(0xFF3860EF),
        leading: GestureDetector(
            onTap: () {
              return Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title:
            const Text("Thread Lists", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text("Direct Threads",
                style: TextStyle(color: Colors.white)),
            children: [
              Container(
                height: 200,
                child: FutureBuilder(
                  future: ThreadApi.threadList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error : ${snapshot.error}");
                    } else if (!snapshot.hasData) {
                      return const Text('No data available');
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.directMsg!.length,
                          itemBuilder: (context, index) {
                            final d_message = snapshot.data!.directMsg![index];
                            final d_thread = snapshot.data!.d_thread![index];
                            return const ListTile();
                          });
                    }
                  },
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text("Group Threads",
                style: TextStyle(color: Colors.white)),
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          color: Colors.red.shade600,
                          child: Center(
                              child: Text(
                            "$index",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          )),
                        ),
                        title: Text("Group $index",
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text("hello $index",
                            style: const TextStyle(
                                color: Color.fromARGB(144, 255, 255, 255))),
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
