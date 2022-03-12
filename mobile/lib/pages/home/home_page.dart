import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/component/_component_exporter.dart';
import 'package:mobile/pages/home/_home_page_exporter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeVC vc = Get.put(HomeVC());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Suw.w(context, 25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CategoryListComponent(
              categoryList: vc.categoryListX.value,
              selectedCategory: vc.selectedCategoryX.value,
              onCategorySelected: vc.onCategorySelected,
              height: Suw.portionHeight(context, 0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: CustomTitle(
              titleText: HomeConstants.BLOG,
              style: KTextStyle.h1(textStyleBase: const TextStyleBase(fontWeight: FontWeight.bold)),
            ),
          ),
          Obx(
            () => BlogListComponent(
              blogList: vc.blogListX.value,
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
