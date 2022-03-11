import 'package:core/src/controllers/account/account_controller_mixin.dart';
import 'package:core/src/services/_services_exporter.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:logger/logger.dart';

class AccountController extends GetxController with AccountControllerMixin {
  Future<Account?> getAccountThunk({
    Function()? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      var response = await AccountServices().getAccount(errorCallback: (visibleError) {
        onError?.call(visibleError);
      });
      if (response == null) {
        throw Exception();
      }
      updateAccount(account: response.data);
      onSuccess?.call();
      return response.data;
    } catch (e) {
      Logger().e("Error on AccountController getAccountThunk. Error: $e");
    }
    return null;
  }

  Future<void> updateAccountThunk({
    required Account account,
    Function()? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      var response = await AccountServices().updateAccount(account, errorCallback: (visibleError) {
        onError?.call(visibleError);
      });
      if (response == null) {
        throw Exception();
      }
      updateAccount(account: account);
      onSuccess?.call();
    } catch (e) {
      Logger().e("Error on AccountController getAccountThunk. Error: $e");
    }
  }
}
