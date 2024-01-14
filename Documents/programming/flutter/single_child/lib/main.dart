import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(const SingleChild());
}

class SingleChild extends StatelessWidget {
  const SingleChild({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            height: 100,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 30, 40),
              child: Placeholder(
                color: Colors.lightBlue,
              ),
            ),
            
          
          ),
        ),
      ),
    );
  }
}
