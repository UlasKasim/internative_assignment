import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Suw {
  static Widget init(Widget child) {
    return ScreenUtilInit(
      builder: () => child,
      designSize: const Size(1080, 1920),
    );
  }

  //Height
  static double w(double width) => ScreenUtil().setWidth(width);

  //Width
  static double h(double height) => ScreenUtil().setHeight(height);

  //Font Size
  static double fs(double paramFontSize) {
    return paramFontSize * 0.35;
    // double fontSize = ScreenUtil.instance.setSp(paramFontSize);
    // if (ScreenUtil.screenWidth >= ScreenUtil.screenHeight) {
    //   double factor = ScreenUtil.screenHeight / ScreenUtil.screenWidth;
    //   return fontSize * factor * 0.8;
    // } else {
    //   double factor = ScreenUtil.screenWidth / ScreenUtil.screenHeight;
    //   return fontSize * factor;
    // }
  }

  static double get scaleWidth => ScreenUtil().scaleWidth;

  static double get scaleHeight => ScreenUtil().scaleHeight;

  static double portionWidth(double portion, {double padding = 0}) =>
      (ScreenUtil().screenWidth - padding) * portion;

  static double portionHeight(double portion, {double padding = 0}) =>
      (ScreenUtil().screenHeight - padding) * portion;
}
