import 'package:flutter/material.dart';

import 'package:flutter_frontend/constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "WELCOME TO SLACK",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(child: Image.asset("assets/images/login2.png")),
            const Spacer()
          ],
        ),
        const SizedBox(
          height: defaultPadding * 2,
        )
      ],
    );
  }
}
