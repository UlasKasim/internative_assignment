import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:logger/logger.dart';

mixin CategoryControllerMixin {
  Rx<Map<String, Category>> categoryMapX = Rx<Map<String, Category>>({});

  List<Category> get categoryList {
    return categoryMapX.value.values.toList();
  }

  void addAll({required List<Category> list}) {
    for (var category in list) {
      categoryMapX.value[category.id!] = category;
    }
    redraw();
  }

  void addOrUpdate({required Category category}) {
    try {
      categoryMapX.value[category.id!] = category;
      redraw();
    } catch (e) {
      Logger logger = Logger();
      logger.e(e);
    }
  }

  void delete({required List<String> list}) {
    for (var categoryID in list) {
      categoryMapX.value.remove(categoryID);
    }
    redraw();
  }

  void redraw() {
    categoryMapX.subject.add(categoryMapX.value);
  }
}
