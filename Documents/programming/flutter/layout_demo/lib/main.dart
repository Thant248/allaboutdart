import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String image = "images/coder.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("The Coders"),
          backgroundColor: const Color.fromARGB(255, 238, 10, 32),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Coding EveryDay!",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(image),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Born To Code",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Count me in",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              //statsu
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.event,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "12.14.2024",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 18),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.green,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  _status() => const Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.event,
                color: Colors.green,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "12.14.2024",
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.green,
              ),
              Icon(
                Icons.star,
                color: Colors.green,
              ),
              Icon(
                Icons.star,
                color: Colors.green,
              ),
              Icon(
                Icons.star,
                color: Colors.green,
              ),
              Icon(
                Icons.star_half,
                color: Colors.green,
              ),
            ],
          )
        ],
      );
}
