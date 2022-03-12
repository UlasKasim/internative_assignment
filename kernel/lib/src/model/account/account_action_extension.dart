import 'package:kernel/kernel.dart';

extension AccountActionExtension on Account {
  void onLocationChanged(Location value) {
    location = value;
  }

  void onImageLinkChanged(String value) {
    image = value;
  }
}
