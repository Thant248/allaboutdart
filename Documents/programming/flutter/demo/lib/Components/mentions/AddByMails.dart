import 'package:flutter/material.dart';

class AddMails extends StatefulWidget {
  const AddMails({super.key});

  @override
  State<AddMails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddMails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("This is Mails"),
    );
  }
}