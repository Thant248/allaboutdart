import "package:flutter/material.dart";

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        leading: const  Icon(Icons.thumb_up),
        centerTitle: false,
        title: const Text("Hello Flutter"),
      )
      ,
      body:  Container(
        alignment: Alignment.center,
        margin:const EdgeInsets.symmetric(vertical: 100),
        decoration:  BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
          boxShadow:  [
             BoxShadow (
              color:  Colors.black,
              offset:   Offset(-10, -10),
              blurRadius: 5,

            ),
          ]),
        child: const CircleAvatar(radius: 80,),
          ),
        
        
        ),

      );
  }
}
