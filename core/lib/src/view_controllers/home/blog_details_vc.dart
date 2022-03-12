import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

import 'mixin/favorite_mixin.dart';

class BlogDetailsVC extends GetxController with FavoriteMixin {
  Rx<Blog> blogX = Blog().obs;

  BlogDetailsVC(Blog blog) {
    blogX.value = blog;
  }
}
