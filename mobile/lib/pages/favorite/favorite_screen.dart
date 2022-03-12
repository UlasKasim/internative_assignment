import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/component/_component_exporter.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoriteVC vc = Get.put(FavoriteVC());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Suw.w(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => BlogListComponent(
              blogList: vc.favoriteListX.value,
              onBlogPressed: (blog) {
                NavigationUtil.getPush(BlogDetailsPage(
                  blog: blog,
                ));
              },
              isFavoriteCallback: (blog) => vc.isFavorite(blog),
              onFavoritePressed: vc.onFavoritePressed,
            ),
          )
        ],
      ),
    );
  }
}
