import 'package:core/src/mixin/_mixin_exporter.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

class BlogDetailsVC extends GetxController with FavoriteMixin {
  Rx<Blog> blogX = Blog().obs;

  BlogDetailsVC(Blog blog) {
    blogX.value = blog;
  }
}
