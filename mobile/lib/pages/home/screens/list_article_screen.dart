import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/home/components/blog/blog_list_component.dart';
import 'package:mobile/pages/home/components/category/category_list_component.dart';

import '../details/blog_details_page.dart';

class ListArticleScreen extends StatelessWidget {
  ListArticleScreen({Key? key}) : super(key: key);

  final ListArticleVC vc = Get.put(ListArticleVC());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Suw.w(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CategoryListComponent(
              categoryList: vc.categoryListX.value,
              selectedCategory: vc.selectedCategoryX.value,
              onCategorySelected: vc.onCategorySelected,
              height: Suw.portionHeight(0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: CustomTitle(
              titleText: "Blog",
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
