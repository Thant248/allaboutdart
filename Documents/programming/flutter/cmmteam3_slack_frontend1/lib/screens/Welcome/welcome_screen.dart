import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/background.dart';
import 'package:flutter_frontend/responsive.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SingleChildScrollView(
      child: SafeArea(
          child: Responsive(
              mobile: MobileWelcomeScreen(),
              desktop: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: WelcomeImage()),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      )
                    ],
                  ))
                ],
              ))),
    ));
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WelcomeImage(), 
        Row(
          children: [
            Spacer(), 
            Expanded(child: LoginAndSignupBtn()), 
            Spacer()
          ],
        )
      ],
    );
  }
}
