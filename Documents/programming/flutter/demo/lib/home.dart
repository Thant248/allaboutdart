import 'package:demo/BottomNavigationBar.dart';
import 'package:demo/Components/generalNavigation/home.dart';

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
            body: const Home(),
            bottomNavigationBar: const BottomNavigate()));
  }
}
