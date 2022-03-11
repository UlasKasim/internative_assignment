import 'package:flutter/material.dart';

import '_style_exporter.dart';

class KDecoration {
  static Decoration boxDecoration({
    Color? backColor,
    Color shadowColor = Colors.transparent,
    Color borderColor = Colors.transparent,
    double borderWidth = 1,
    String? backgroundImagePath,
    BoxFit? boxFit,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backColor ?? Colors.transparent,
      border: Border.all(width: borderWidth, color: borderColor),
      image: backgroundImagePath != null
          ? DecorationImage(
              image: AssetImage(backgroundImagePath),
              fit: boxFit ?? BoxFit.cover,
            )
          : null,
      borderRadius: borderRadius ?? BorderRadius.zero,
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }

  /// TopLeft,TopRight, BottomLeft, BottomRight
  static OutlineInputBorder textfieldDecoration({
    BorderRadius? borderRadius,
    Color? borderColor,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? KColors.primaryColor.withOpacity(0.3),
      ),
      borderRadius: borderRadius ?? BorderRadius.zero,
    );
  }
}
