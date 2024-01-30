import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
  return const Scaffold(
      body: Text("This is Contact"),
    );
  }
}