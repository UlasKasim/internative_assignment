import 'package:flutter/material.dart';

class TextStyleConstans {
  static const Color color = Colors.black;
  static const double height = 1;
  static const FontWeight fontWeight = FontWeight.normal;
  static const FontStyle fontStyle = FontStyle.normal;
  static const Color shadowColor = Colors.transparent;
}

class TextStyleBase {
  final Color color;
  final double height;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color shadowColor;

  const TextStyleBase({
    this.color = TextStyleConstans.color,
    this.height = TextStyleConstans.height,
    this.fontWeight = TextStyleConstans.fontWeight,
    this.fontStyle = TextStyleConstans.fontStyle,
    this.shadowColor = TextStyleConstans.shadowColor,
  });
}
