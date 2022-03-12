import 'dart:io';

import 'package:core/core.dart';
import 'package:core/src/library/config/server_config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kernel/kernel.dart';

class ProfileVC extends GetxController {
  Rx<Location> locationX = Location().obs;
  RxString selectedFileUrl = "".obs;
  // RxString filenameX = "".obs;
  final ImagePicker imagePicker = ImagePicker();

  AccountController accountController = Get.find();
  GeneralController generalController = Get.find();

  @override
  void onInit() async {
    super.onInit();

    if (accountController.accountX.value.location?.longitude == "" ||
        accountController.accountX.value.location?.latitude == "") {
      var position = await determinePosition();
      await accountController.updateAccountThunk(
          account: accountController.accountX.value
            ..onLocationChanged(Location(
                latitude: position.latitude.toString(), longitude: position.longitude.toString())));
      accountController.accountX.refresh();
    }
  }

  void onFileSelectPressed(ImageSource imageSource) async {
    XFile? photo = await imagePicker.pickImage(source: imageSource);
    if (photo != null) {
      callLoadingDialog();
      await generalController.uploadImage(
        file: File(photo.path),
        filename: photo.name,
        onError: (e) {
          closeLoadingDialog();
          errorSnackbar(toastTitle: "Error", toastMessage: "Error occured during uploading image");
        },
        onSuccess: (url) async {
          closeLoadingDialog();
          selectedFileUrl.value = url;
          Get.back();
        },
      );
    }
  }

  void onFileRemovePressed() {
    selectedFileUrl.value = "";
  }

  void setLocation(Location value) {
    locationX.value = value;
  }

  void onSavePressed() async {
    await _updateAccount(
        locationX.value,
        selectedFileUrl.value == ""
            ? accountController.accountX.value.image!
            : selectedFileUrl.value);
  }

  Future<void> _updateAccount(Location location, String imageLink) async {
    await accountController.updateAccountThunk(
      account: accountController.accountX.value
        ..onLocationChanged(location)
        ..onImageLinkChanged(imageLink),
      onSuccess: () {
        successSnackbar(toastTitle: "Success", toastMessage: "Profile Updated");
        accountController.accountX.refresh();
        onFileRemovePressed();
      },
      onError: (e) {
        errorSnackbar(toastTitle: "Error", toastMessage: e);
      },
    );
  }

  void onLogout() {
    ServerConfig.TOKEN = "";
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
