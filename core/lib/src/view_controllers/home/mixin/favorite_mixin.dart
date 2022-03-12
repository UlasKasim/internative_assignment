import 'package:core/src/controllers/_controller_exporter.dart';
import 'package:core/src/widgets/_widgets_exporter.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

mixin FavoriteMixin {
  BlogController blogController = Get.find();
  AccountController accountController = Get.find();

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
