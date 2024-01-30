import 'package:flutter/material.dart';

class AddGoogle extends StatefulWidget {
  const AddGoogle({super.key});

  @override
  State<AddGoogle> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddGoogle> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: Text("This is Google"),
    );
  }
}