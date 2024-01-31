import 'package:demo/Components/generalNavigation/you.dart';
import 'package:flutter/material.dart';

class Invitations extends StatefulWidget {
  const Invitations({super.key});

  @override
  State<Invitations> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Invitations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const You()));
            },
            icon: const Icon(Icons.close)),
        title: Row(
          children: [
            TextButton(onPressed: () {}, child: Text("Invitations to connect")),
            RichText(
                text: TextSpan(children: [
              WidgetSpan(
                  child: TextButton(
                      onPressed: () {}, child: const Text("Learn More")))
            ]))
          ],
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.group_add_rounded))
        ],
      ),
    );
  }
}
