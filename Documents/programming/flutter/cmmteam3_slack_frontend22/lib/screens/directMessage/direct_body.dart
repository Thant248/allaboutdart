import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';

class Bodys extends StatelessWidget {
  const Bodys({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(),
          decoration: const BoxDecoration(color: Colors.blue),
          child: SafeArea(
              child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 58,
                decoration: BoxDecoration(
                  color: kPriamrybackground,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type Message",
                        border: InputBorder.none,
                      ),
                    )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.send_outlined))
                  ],
                ),
              ))
            ],
          )),
        )
      ],
    );
  }
}
