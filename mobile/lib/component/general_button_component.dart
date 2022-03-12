import 'package:core/core.dart';
import 'package:flutter/material.dart';

class GeneralButtonComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;
  final bool isPrimaryBackground, rotate, onlyExpand;
  const GeneralButtonComponent({
    Key? key,
    required this.text,
    this.icon = Icons.login_sharp,
    required this.onPressed,
    required this.isPrimaryBackground,
    this.rotate = false,
    this.onlyExpand = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var expanded = Expanded(
      child: RectangleTextButton(
        rotate: rotate ? 180 : 0,
        text: text,
        backColor: isPrimaryBackground ? KColors.primaryColor : Colors.white,
        textStyle: KTextStyle.h3(
          textStyleBase: TextStyleBase(
            color: isPrimaryBackground ? Colors.white : KColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: icon,
        iconSize: 20,
        textColor: isPrimaryBackground ? Colors.white : KColors.primaryColor,
        onPressed: onPressed,
      ),
    );
    if (onlyExpand) return expanded;
    return Row(
      children: [expanded],
    );
  }
}
