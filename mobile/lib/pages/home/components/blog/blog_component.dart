import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:kernel/kernel.dart';

class BlogComponent extends StatelessWidget {
  final Blog blog;
  final bool isFavorite;
  final Function() onFavoritePressed;
  const BlogComponent({
    Key? key,
    required this.blog,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Suw.h(450),
      width: Suw.w(540),
      decoration: KDecoration.boxDecoration(
          backColor: KColors.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                child: Container(
                  height: Suw.h(450),
                  width: Suw.w(540),
                  padding: EdgeInsets.zero,
                  decoration: KDecoration.boxDecoration(
                    backgroundImagePath: blog.image!,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onFavoritePressed,
                    iconSize: 30,
                    icon: const Icon(Icons.favorite),
                    color: isFavorite ? KColors.negativeColor : KColors.primaryColor,
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Text(
              blog.title!,
              style: KTextStyle.h3(),
            ),
          ),
        ],
      ),
    );
  }
}
