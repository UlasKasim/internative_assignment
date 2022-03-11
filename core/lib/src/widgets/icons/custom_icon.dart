import 'package:core/src/style/_style_exporter.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double? iconSize, textHeigh, textWidth, borderWidth;
  final EdgeInsets? iconPadding;
  final BorderRadius? borderRadius;
  final Color? iconColor, borderColor, backColor, hoverColor;
  final Function()? onPressed;
  final String? toolTipMessage, textForIcon;
  final TextStyle? textstyle;

  const CustomIcon({
    Key? key,
    this.icon = Icons.insert_drive_file,
    this.textForIcon,
    this.borderWidth,
    this.iconSize,
    this.iconPadding,
    this.iconColor,
    this.borderRadius,
    this.backColor,
    this.hoverColor,
    this.borderColor,
    this.onPressed,
    this.toolTipMessage,
    this.textstyle,
    this.textHeigh,
    this.textWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return toolTipMessage != null
        ? Tooltip(
            message: toolTipMessage ?? "",
            child: _buildMaterialMain(),
          )
        : _buildMaterialMain();
  }

  Widget _buildMaterialMain() {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.zero,
        onTap: onPressed,
        hoverColor: hoverColor ?? KColors.hoverColor.withOpacity(0.5),
        child: Container(
          decoration: KDecoration.boxDecoration(
            borderWidth: borderWidth ?? 0.5,
            backColor: backColor,
            borderColor: borderColor ?? KColors.primaryColor.withOpacity(0.7),
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
          padding: iconPadding ?? const EdgeInsets.all(20),
          child: textForIcon != null
              ? Container(
                  decoration: KDecoration.boxDecoration(
                    borderRadius: borderRadius ?? BorderRadius.zero,
                  ),
                  height: textHeigh ?? 80,
                  width: textWidth ?? 80,
                  child: Center(
                    child: Text(
                      textForIcon ?? "",
                      style: textstyle ??
                          KTextStyle.h1(
                            textStyleBase: const TextStyleBase(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    ),
                  ),
                )
              : Icon(
                  icon,
                  size: iconSize ?? 38,
                  color: iconColor ?? KColors.primaryColor,
                ),
        ),
      ),
    );
  }
}
