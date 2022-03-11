import 'package:flutter/material.dart';

class AnimationConstants {
  static Animation<double> curvedAnimation(
          {required AnimationController animationController, int order = 1}) =>
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval((1 / 9) * order, 1.0, curve: Curves.fastOutSlowIn),
        ),
      );
}
