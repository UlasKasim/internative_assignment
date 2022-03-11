import 'package:core/src/style/_style_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'rectangle_text_button.dart';

class CustomCloseButton extends StatelessWidget {
  final Function? onPressed;
  final String? buttonText;
  final double? height, width;
  final Color? color;
  const CustomCloseButton({
    Key? key,
    this.onPressed,
    this.buttonText,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RectangleTextButton(
      height: height,
      width: width,
      text: buttonText ?? "KAPAT",
      backColor: color ?? KColors.negativeColor.withOpacity(0.7),
      textColor: Colors.black,
      onPressed: onPressed ??
          () {
            Get.back();
          },
    );
  }
}
