import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:logger/logger.dart';
import '../../services/_services_exporter.dart';
import 'category_controller_mixin.dart';

class CategoryController extends GetxController with CategoryControllerMixin {
  Future<List<Category>?>? getCategoriesThunk({
    Function()? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      var response = await CategoryServices().getCategories(errorCallback: (visibleError) {
        onError?.call(visibleError);
      });
      if (response == null) {
        throw Exception();
      }
      addAll(list: response.data);
      onSuccess?.call();
      return response.data;
    } catch (e) {
      Logger().e("Error on CategoryController getCategoriesThunk. Error: $e");
    }
    return null;
  }
}
