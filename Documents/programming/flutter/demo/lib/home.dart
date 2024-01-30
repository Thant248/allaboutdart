import 'package:demo/BottomNavigationBar.dart';
import 'package:demo/Components/HomeNavigations/AddDescription.dart';
import 'package:demo/Components/HomeNavigations/AddPeopple.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.name, required this.bodyname})
      : super(key: key);

  final String name;
  final String bodyname;

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  String text =
      """Slack is a messaging app for groups of people who work together.
        You can send updates, shares files, and organize conversations os 
        that everyone is in the loop""";

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              backgroundColor: Colors.lightBlue,
              iconTheme: const IconThemeData(),
              actions: [],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Center(
                        child: RichText(
                          text: const TextSpan(
                              text: "Welcome !",
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Center(
                        child: RichText(
                            text: TextSpan(text: text, spellOut: true,)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => const AddDescription()),
                              );
                            },
                            icon: const Icon(
                                Icons.add), // Replace with your desired icon
                            label: const Text("Add Description"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => const AddPeople()),
                              );
                            },
                            icon: const Icon(
                                Icons.man), // Replace with your desired icon
                            label: const Text("Add People"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigate()));
  }
}


