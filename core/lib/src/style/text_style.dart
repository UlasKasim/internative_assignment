import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '_style_exporter.dart';

class KTextStyle {
  ///FontSize:22
  static TextStyle h1({
    TextStyleBase textStyleBase = const TextStyleBase(),
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          height: textStyleBase.height,
          fontSize: 22,
          color: textStyleBase.color,
          fontWeight: textStyleBase.fontWeight,
          fontStyle: textStyleBase.fontStyle,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: textStyleBase.shadowColor,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
      );

  ///FontSize:18
  static TextStyle h2({
    TextStyleBase textStyleBase = const TextStyleBase(),
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          height: textStyleBase.height,
          fontSize: 18,
          color: textStyleBase.color,
          fontWeight: textStyleBase.fontWeight,
          fontStyle: textStyleBase.fontStyle,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: textStyleBase.shadowColor,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
      );

  ///FontSize:14
  static TextStyle h3({
    TextStyleBase textStyleBase = const TextStyleBase(),
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          height: textStyleBase.height,
          fontSize: 14,
          color: textStyleBase.color,
          fontWeight: textStyleBase.fontWeight,
          fontStyle: textStyleBase.fontStyle,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: textStyleBase.shadowColor,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
      );

  ///FontSize:12
  static TextStyle h4({
    TextStyleBase textStyleBase = const TextStyleBase(),
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          height: textStyleBase.height,
          fontSize: 12,
          color: textStyleBase.color,
          fontWeight: textStyleBase.fontWeight,
          fontStyle: textStyleBase.fontStyle,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: textStyleBase.shadowColor,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
      );

  ///FontSize:10
  static TextStyle h5({
    TextStyleBase textStyleBase = const TextStyleBase(),
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          height: textStyleBase.height,
          fontSize: 10,
          color: textStyleBase.color,
          fontWeight: textStyleBase.fontWeight,
          fontStyle: textStyleBase.fontStyle,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: textStyleBase.shadowColor,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
      );

  ///FontSize:8
  static TextStyle h6({
    TextStyleBase textStyleBase = const TextStyleBase(),
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          height: textStyleBase.height,
          fontSize: 8,
          color: textStyleBase.color,
          fontWeight: textStyleBase.fontWeight,
          fontStyle: textStyleBase.fontStyle,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: textStyleBase.shadowColor,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
      );
}

class JojoTextStyle {
  static TextStyle? greatTitle({required BuildContext context, Color? color}) =>
      Theme.of(context).textTheme.headline4?.copyWith(
            color: color ?? Colors.black,
            height: 0.5,
          );
  static TextStyle? title({required BuildContext context, Color? color, FontWeight? fontWeight}) =>
      Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(color: color ?? Colors.black, fontWeight: fontWeight ?? FontWeight.w600);

  static TextStyle? subTitle(
          {required BuildContext context, Color? color, FontWeight? fontWeight}) =>
      Theme.of(context).textTheme.subtitle1?.copyWith(
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.normal,
          );
  static TextStyle? subText(
          {required BuildContext context, Color? color, FontWeight? fontWeight}) =>
      Theme.of(context).textTheme.caption?.copyWith(
            color: color ?? Colors.black.withOpacity(0.7),
            fontWeight: fontWeight ?? FontWeight.normal,
          );

  static TextStyle? buttonText({required BuildContext context, Color? color}) =>
      Theme.of(context).textTheme.button?.copyWith(
            color: color ?? Colors.black,
          );

  static TextStyle? tableTitle({required BuildContext context, Color? color}) =>
      Theme.of(context).textTheme.subtitle1?.copyWith(
            color: color ?? Colors.black,
            fontWeight: FontWeight.w500,
          );

  static TextStyle? tableTitle2({required BuildContext context, Color? color}) =>
      Theme.of(context).textTheme.subtitle2?.copyWith(
            color: color ?? Colors.black,
            fontWeight: FontWeight.w500,
          );

  static TextStyle? tableItem({required BuildContext context, Color? color}) =>
      Theme.of(context).textTheme.bodyText1?.copyWith(
            color: color ?? Colors.black.withOpacity(0.5),
          );

  static TextStyle? textFieldLabel({required BuildContext context, Color? color}) =>
      Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: color ?? Colors.black.withOpacity(0.2), height: 1);

  static TextStyle? textFieldHint({required BuildContext context, Color? color}) =>
      Theme.of(context).textTheme.bodyText1?.copyWith(color: color ?? Colors.black);

  static TextStyle? menuText({required BuildContext context, Color? color}) =>
      JojoTextStyle.tableTitle(
        context: context,
        color: color ?? Colors.black,
      );
}
