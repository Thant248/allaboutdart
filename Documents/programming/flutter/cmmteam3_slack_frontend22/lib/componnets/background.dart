import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background(
      {Key? key,
      required this.child,
      this.topImage = "assets/images/main_top.png",
      this.bottomImage = "assets/images/login_bottom.png"});

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPriamrybackground,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  topImage,
                  width: 120,
                )),
            SafeArea(child: child)
          ],
        ),
      ),
    );
  }
}
