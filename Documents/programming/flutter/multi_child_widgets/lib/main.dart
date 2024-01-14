import 'package:flutter/material.dart';

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
          title: const Text("Multi Child"),
          iconTheme: const IconThemeData(color: Colors.amber),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/WIN_20231208_11_17_45_Pro.jpg"),
              Text(
                "Hello Stack",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.amber),
              ),
              const Expanded(
                flex: 1,
                child: Placeholder(),
              ),
              const Expanded(
                flex: 2,
                child: Placeholder(),
              )
            ],
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
