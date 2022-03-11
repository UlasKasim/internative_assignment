import 'dart:async';
import 'package:core/src/style/_style_exporter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RectangleTextButton extends StatefulWidget {
  final String? text;
  final Color? borderColor, hoverColor;
  final Color textColor, backColor;
  final Function? onPressed;
  final double? height, width, iconSize;
  final IconData? icon;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? textPadding;

  const RectangleTextButton({
    Key? key,
    this.height,
    this.width,
    this.text = "Text",
    this.hoverColor,
    this.onPressed,
    this.icon,
    this.textAlign,
    this.iconSize,
    this.borderColor,
    this.textColor = Colors.black,
    this.backColor = Colors.white,
    this.textStyle,
    this.textPadding,
  }) : super(key: key);

  @override
  _RectangleTextButtonState createState() => _RectangleTextButtonState();
}

class _RectangleTextButtonState extends State<RectangleTextButton> {
  late int time;
  late num cooldown;
  bool isPressable = true;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    time = DateTime.now().millisecondsSinceEpoch - 2000;
    cooldown = 1.0;
    timer = Timer(const Duration(seconds: 1), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 50,
      width: widget.width ?? 150,
      decoration: KDecoration.boxDecoration(
          borderColor: widget.borderColor ?? KColors.primaryColor.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          backColor: isPressable ? widget.backColor : widget.backColor.withAlpha(80)),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          hoverColor: widget.hoverColor ?? KColors.hoverColor.withOpacity(0.1),
          onTap: () {
            if ((DateTime.now().millisecondsSinceEpoch - time) / 1000 > cooldown) {
              stateReset();
              time = DateTime.now().millisecondsSinceEpoch;
              widget.onPressed?.call();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.icon != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    widget.icon ?? Icons.ac_unit,
                    size: widget.iconSize ?? 28,
                    color: widget.textColor,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: widget.textPadding ?? EdgeInsets.zero,
                  child: Text(
                    widget.text ?? "",
                    style: widget.textStyle ??
                        KTextStyle.h5(
                          textStyleBase: TextStyleBase(
                            color: widget.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    textAlign: widget.textAlign ?? TextAlign.center,
                  ),
                ),
              ),
              if (widget.icon != null)
                SizedBox(
                  width: (widget.iconSize ?? 28) + 16,
                )
            ],
          ),
        ),
      ),
    );
  }

  void stateReset() {
    isPressable = false;
    setState(() {});
    timer = Timer(const Duration(seconds: 1), () {
      isPressable = true;
      setState(() {});
    });
    // Future.delayed(Duration(seconds: 1)).then((value) {
    //   isPressable = true;
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
