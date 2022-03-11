import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

class FavoriteVC extends GetxController {
  Rx<List<Blog>> blogListX = Rx<List<Blog>>([]);
  Rx<List<Blog>> favoriteListX = Rx<List<Blog>>([]);

  CategoryController categoryController = Get.find();
  BlogController blogController = Get.find();
  AccountController accountController = Get.find();

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

  bool isFavorite(Blog blog) {
    return accountController.accountX.value.favoriteBlogIds!.any((blogID) => blog.id == blogID);
  }

  void onFavoritePressed(Blog blog) async {
    await blogController.toggleFavorite(
      favoriteID: blog.id!,
      onSuccess: (msg) async {
        successSnackbar(toastTitle: "Başarılı", toastMessage: msg);
        await accountController.getAccountThunk();
      },
      onError: (e) {
        errorSnackbar(toastTitle: "Başarısız", toastMessage: e);
      },
    );
  }
}
