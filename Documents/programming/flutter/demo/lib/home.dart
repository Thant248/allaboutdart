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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: Colors.lightBlue,
          iconTheme: const IconThemeData(),
        ),
        body: Center(
          child: Text(widget.bodyname),
        ),
        bottomNavigationBar: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Previous Page')),
      ),
    );
  }
}
