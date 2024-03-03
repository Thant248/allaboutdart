import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProgressionBar extends StatelessWidget {
  final double height;
  final double size;
  final String imageName;

  const ProgressionBar({
    Key? key,
    required this.imageName,
    required this.height,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // double size = constraints.maxWidth < constraints.maxHeight
          //     ? constraints.maxWidth
          //     : constraints.maxHeight;
          return Lottie.asset(
            'assets/lotties/$imageName',
            height: height,
            width: size,
          );
        },
      ),
    );
  }
}
