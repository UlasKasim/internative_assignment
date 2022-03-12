import 'package:flutter/material.dart';

class Suw {
  //Height
  static double scaleWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double scaleHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double w(BuildContext context, double width) => (scaleWidth(context) / 1080) * width;

  //Width
  static double h(BuildContext context, double height) => (scaleHeight(context) / 1920) * height;

  static double portionWidth(BuildContext context, double portion, {double padding = 0}) =>
      (scaleWidth(context) - padding) * portion;

  static double portionHeight(BuildContext context, double portion, {double padding = 0}) =>
      (scaleHeight(context) - padding) * portion;
}
