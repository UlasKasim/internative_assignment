import 'package:core/core.dart';
import 'package:core/src/mixin/_mixin_exporter.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

class FavoriteVC extends GetxController with FavoriteMixin {
  Rx<List<Blog>> blogListX = Rx<List<Blog>>([]);
  Rx<List<Blog>> favoriteListX = Rx<List<Blog>>([]);

  CategoryController categoryController = Get.find();

  @override
  void onInit() async {
    super.onInit();
    await initializeBlogs();
    filterFavorites();

    ever(accountController.accountX, (d) {
      filterFavorites();
    });
  }

  Future<void> initializeBlogs() async {
    blogListX.value = await blogController.getBlogsThunk(categoryId: "") ?? [];
    blogListX.refresh();
  }

  void filterFavorites() async {
    favoriteListX.value = blogListX.value
        .where((element) => accountController.accountX.value.favoriteBlogIds!.contains(element.id))
        .toList();
    favoriteListX.refresh();
  }
}
