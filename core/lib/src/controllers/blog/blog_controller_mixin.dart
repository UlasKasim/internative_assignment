import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:logger/logger.dart';

mixin BlogControllerMixin {
  Rx<Map<String, Blog>> blogMapX = Rx<Map<String, Blog>>({});

  List<Blog> get blogList {
    return blogMapX.value.values.toList();
  }

  void addAll({required List<Blog> list}) {
    for (var blog in list) {
      blogMapX.value[blog.id!] = blog;
    }
    redraw();
  }

  void addOrUpdate({required Blog blog}) {
    try {
      blogMapX.value[blog.id!] = blog;
      redraw();
    } catch (e) {
      Logger logger = Logger();
      logger.e(e);
    }
  }

  void delete({required List<String> list}) {
    for (var blogID in list) {
      blogMapX.value.remove(blogID);
    }
    redraw();
  }

  void redraw() {
    blogMapX.refresh();
  }
}
