import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/screens/SignUp/signup_screen.dart';

import '../../Login/login_form.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginForm()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimarybtnColor)),
            child: Text(
              'Login'.toUpperCase().toString(),
            )),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimarybtnColor)),
            child: Text(
              "Sign Up".toUpperCase(),
            ))
      ],
    );
  }
}
