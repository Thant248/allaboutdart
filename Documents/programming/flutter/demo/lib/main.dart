import 'package:demo/extra/dropDownDemo.dart';
import 'package:demo/extra/dropDownDemoTwo.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const name = "DemoStration View";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(name),
          backgroundColor: Colors.lightBlue,
          iconTheme: const IconThemeData(),
        ),
        body: const Demo2(),
      ),
    );
  }
}
