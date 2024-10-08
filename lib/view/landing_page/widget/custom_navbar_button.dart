import 'package:flutter/material.dart';

class CustomNavbarButton extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scaleAnimations;
  Function onTap;
  final Animation<Color?> colorAnimations;
  final IconData iconData;
  CustomNavbarButton(
      {super.key,
      required this.colorAnimations,
      required this.controller,
      required this.iconData,
      required this.onTap,
      required this.scaleAnimations});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimations.value,
          child: IconButton(
              highlightColor: Colors.red.shade100,
              onPressed: () {
                onTap();
              },
              icon: Icon(
                iconData,
                color: colorAnimations.value,
              )),
        );
      },
    );
  }
}
