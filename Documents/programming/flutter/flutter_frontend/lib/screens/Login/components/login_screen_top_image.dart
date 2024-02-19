import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ), 
        const SizedBox(height: defaultPadding * 2,), 
        Row(
          children: [
            const Spacer(), 
            Expanded(child: SvgPicture.asset("assets/icons/login.svg")), 
            const Spacer()
          ],
        ),
        const SizedBox(height: defaultPadding * 2,)
      ],
    );
  }
}
