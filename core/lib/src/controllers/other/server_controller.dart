import 'package:core/src/controllers/_controller_exporter.dart';
import 'package:get/get.dart';

class ServerController extends GetxController {
  UserController userController = Get.put(UserController());
  AccountController accountController = Get.put(AccountController());
  BlogController blogController = Get.put(BlogController());
  CategoryController categoryController = Get.put(CategoryController());

  Future<void> onStartServer() async {
    await categoryController.getCategoriesThunk();
    await accountController.getAccountThunk();
  }
}
