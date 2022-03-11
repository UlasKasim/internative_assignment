import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

class ListArticleVC extends GetxController {
  Rx<List<Category>> categoryListX = Rx<List<Category>>([]);
  Rx<List<Blog>> blogListX = Rx<List<Blog>>([]);
  Rx<Category> selectedCategoryX = Category().obs;

  CategoryController categoryController = Get.find();
  BlogController blogController = Get.find();
  AccountController accountController = Get.find();

  @override
  void onInit() {
    super.onInit();
    initCategories();
    filterBlogs();

    ever(selectedCategoryX, (d) {
      filterBlogs();
    });
    ever(accountController.accountX, (d) {
      selectedCategoryX.refresh();
    });
  }

  void initCategories() {
    categoryListX.value = categoryController.categoryList;
  }

  void filterBlogs() async {
    blogListX.value =
        await blogController.getBlogsThunk(categoryId: selectedCategoryX.value.id) ?? [];
  }

  void onCategorySelected(Category category) {
    selectedCategoryX.value = category;
    selectedCategoryX.refresh();
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
