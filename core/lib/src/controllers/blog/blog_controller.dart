import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:logger/logger.dart';
import '../../services/_services_exporter.dart';
import 'blog_controller_mixin.dart';

class BlogController extends GetxController with BlogControllerMixin {
  Future<List<Blog>?>? getBlogsThunk({
    String? categoryId,
    Function()? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      var response = await BlogServices().getBlogs(categoryId, errorCallback: (visibleError) {
        onError?.call(visibleError);
      });
      if (response == null) {
        throw Exception();
      }
      addAll(list: response.data);
      onSuccess?.call();
      return response.data;
    } catch (e) {
      Logger().e("Error on BlogController getBlogsThunk. Error: $e");
    }
    return null;
  }

  Future<void>? toggleFavorite({
    required String favoriteID,
    Function(String)? onSuccess,
    Function? onError,
  }) async {
    try {
      var response = await BlogServices().toggleFavorite(favoriteID, errorCallback: (visibleError) {
        onError?.call(visibleError);
      });
      if (response == null) {
        throw Exception();
      }

      onSuccess?.call(response.data);
    } catch (e) {
      Logger().e("Error on BlogController toggleFavorite. Error: $e");
    }
  }
}
