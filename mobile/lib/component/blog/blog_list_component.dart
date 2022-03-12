import 'package:flutter/material.dart';
import 'package:kernel/kernel.dart';

import 'blog_component.dart';

class BlogListComponent extends StatelessWidget {
  final List<Blog> blogList;
  final Function(Blog) onBlogPressed, onFavoritePressed;
  final bool Function(Blog) isFavoriteCallback;
  const BlogListComponent({
    Key? key,
    required this.blogList,
    required this.onBlogPressed,
    required this.onFavoritePressed,
    required this.isFavoriteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          // mainAxisExtent: 1,
        ),
        itemCount: blogList.length,
        itemBuilder: (_, i) {
          Blog blog = blogList[i];
          return InkWell(
            onTap: () => onBlogPressed.call(blog),
            child: BlogComponent(
              blog: blog,
              isFavorite: isFavoriteCallback.call(blog),
              onFavoritePressed: () => onFavoritePressed.call(blog),
            ),
          );
        },
      ),
    );
  }
}
