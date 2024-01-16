import 'package:dating_app/body.dart';
import 'package:flutter/material.dart';

class Photo extends StatefulWidget {
  const Photo({super.key});

  @override
  State<Photo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.ac_unit_sharp))
        ],
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Welcome',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Body(),
    );
    
  }
}
