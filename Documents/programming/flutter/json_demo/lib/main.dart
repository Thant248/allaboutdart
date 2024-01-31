import 'package:flutter/material.dart';
import 'package:json_demo/screen/home_screen.dart';


void main(List<String> args) {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Rest Api',
        home:  HomePage()
      );
  }
}
