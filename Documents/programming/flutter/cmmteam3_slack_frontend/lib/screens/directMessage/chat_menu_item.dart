import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuIcons extends StatelessWidget {
  const MenuIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue[300],
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue[200],
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue[100],
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
