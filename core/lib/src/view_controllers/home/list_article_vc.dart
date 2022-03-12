import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

import 'mixin/favorite_mixin.dart';

class ListArticleVC extends GetxController with FavoriteMixin {
  Rx<List<Category>> categoryListX = Rx<List<Category>>([]);
  Rx<List<Blog>> blogListX = Rx<List<Blog>>([]);
  Rx<Category> selectedCategoryX = Category().obs;

  CategoryController categoryController = Get.find();

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
}
