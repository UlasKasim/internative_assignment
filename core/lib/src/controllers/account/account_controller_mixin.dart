import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

mixin AccountControllerMixin {
  Rx<Account> accountX = Account().obs;

  void updateAccount({required Account account}) {
    if (account.image == "string") account.image = "";
    accountX.value = account;
  }

  void redraw() {
    accountX.refresh();
  }
}
