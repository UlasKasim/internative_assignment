import 'package:core/src/style/_style_exporter.dart';
import 'package:flutter/material.dart';

class ImageCircleAvatar extends StatelessWidget {
  final String? imageLink;
  final num radius;
  final Function() onCameraPressed;

  const ImageCircleAvatar({
    Key? key,
    this.imageLink,
    this.radius = 50.0,
    required this.onCameraPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        children: [
          CircleAvatar(
            radius: radius as double?,
            child: imageLink != ""
                ? null
                : Text("Seçilmedi",
                    style: KTextStyle.h1(textStyleBase: const TextStyleBase(color: Colors.white))),
            backgroundImage: imageLink != "" ? NetworkImage(imageLink!) : null,
            backgroundColor: imageLink != "" ? Colors.transparent : KColors.primaryColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(right: 20, bottom: 20),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        onCameraPressed.call();
                      },
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: KColors.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
