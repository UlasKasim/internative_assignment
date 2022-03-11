import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

class BlogDetailsVC extends GetxController {
  Rx<Blog> blogX = Blog().obs;

  AccountController accountController = Get.find();
  BlogController blogController = Get.find();

  BlogDetailsVC(Blog blog) {
    blogX.value = blog;
  }

  bool isFavorite() {
    return accountController.accountX.value.favoriteBlogIds!
        .any((blogID) => blogX.value.id == blogID);
  }

  void onFavoritePressed() async {
    await blogController.toggleFavorite(
      favoriteID: blogX.value.id!,
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
