import 'package:core/src/style/_style_exporter.dart';
import 'package:core/src/utilities/_utility_exporter.dart';
import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final double? height, width, padding;
  final String url;
  final BoxFit boxFit;
  final bool isAssetImage;
  const ImageBox({
    Key? key,
    this.height,
    this.width,
    this.padding,
    required this.url,
    this.boxFit = BoxFit.contain,
    this.isAssetImage = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(vertical: padding ?? 20, horizontal: padding ?? 20),
      decoration: KDecoration.boxDecoration(),
      child: !isAssetImage
          ? url == ""
              ? const Center(child: Text("Image couldn't load"))
              : Image.network(
                  url,
                  height: height ?? Suw.h(context, 120),
                  width: width,
                  fit: boxFit,
                  frameBuilder: (cntx, w, val, boolean) {
                    if (val == null) {
                      return Center(
                        child: Image.asset(
                          'assets/images/loader.gif',
                          height: Suw.h(context, 120),
                          width: Suw.h(context, 120),
                        ),
                      );
                    }
                    return w;
                  },
                )
          : Image.asset(
              url,
              fit: boxFit,
            ),
    );
  }
}
