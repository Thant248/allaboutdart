import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';

class GroupMsgs extends StatelessWidget {
  final String? channalName;
  final bool? sign;
   GroupMsgs({super.key,this.channalName,this.sign});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: navColor,
        leading: sign ?? false  
        ? const Icon(Icons.tag)
        : const Icon(Icons.lock),
        title: Text("$channalName",style: TextStyle(color: kPrimaryTextColor),),
      ),
    );
  }
}