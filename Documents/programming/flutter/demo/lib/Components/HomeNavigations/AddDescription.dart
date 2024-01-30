import 'package:flutter/material.dart';

class AddDescription extends StatelessWidget {
  const AddDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:   TextButton(onPressed: () => Navigator.pop(context) , child:  Text('Add Description')),
      ),
    );
  }
}