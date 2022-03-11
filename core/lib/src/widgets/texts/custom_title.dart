import 'package:core/src/style/_style_exporter.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String titleText;
  final Color textColor;
  final TextStyle? style;
  final TextAlign? textAlign;
  const CustomTitle(
      {Key? key,
      this.titleText = "TitleText",
      this.textColor = Colors.black,
      this.style,
      this.textAlign})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: style ??
          KTextStyle.h4(
            textStyleBase: TextStyleBase(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
