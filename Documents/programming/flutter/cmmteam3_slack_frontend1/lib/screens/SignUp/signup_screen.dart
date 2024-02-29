import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/background.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/responsive.dart';
import 'package:flutter_frontend/screens/SignUp/components/sign_up_top_image.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SingleChildScrollView(
      child: Responsive(
          mobile: MobileSignupScreen(),
          desktop: Row(
            children: [
              Expanded(child: SignUpScreenTopImage()),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 450,
                    child: SignUpForm(),
                  ),
                  SizedBox(
                    height: defaultPadding / 2,
                  )
                ],
              ))
            ],
          )),
    ));
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
