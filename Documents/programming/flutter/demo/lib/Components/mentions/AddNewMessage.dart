import 'package:flutter/material.dart';

class AddMessage extends StatefulWidget {
  const AddMessage({super.key});

  @override
  State<AddMessage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddMessage> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: Text("This is Message"),
    );
  }
}