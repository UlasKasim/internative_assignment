import 'package:core/core.dart';
import 'package:core/src/mixin/_mixin_exporter.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

class HomeVC extends GetxController with FavoriteMixin {
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
