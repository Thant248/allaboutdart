import 'package:flutter/material.dart';

class AddPeople extends StatelessWidget {
  const AddPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Add People')),
      ),
    );
  }
}
