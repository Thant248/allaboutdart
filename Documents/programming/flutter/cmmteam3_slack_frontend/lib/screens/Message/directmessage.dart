import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
class directMsg extends StatelessWidget {
  final String? name;
  final String? fname;
  directMsg({super.key,this.name,this.fname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: navColor,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Center(child: Text("$fname",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          ),
        ),
        title: Text("$name"),
      ),
    );
  }
}