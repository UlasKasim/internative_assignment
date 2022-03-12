import 'package:core/src/library/config/server_config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:kernel/kernel.dart';

class PlacePickerComponent extends StatelessWidget {
  final Function(Location) onPlacePicked;
  final Location initialPosition;
  final double height;
  const PlacePickerComponent({
    Key? key,
    required this.onPlacePicked,
    required this.initialPosition,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: PlacePicker(
          apiKey: ServerConfig.MAPS_API_KEY,
          usePlaceDetailSearch: false,
          selectInitialPosition: true,
          initialPosition: LatLng(
              double.parse(
                  initialPosition.latitude! == "" ? "41.0252104" : initialPosition.latitude!),
              double.parse(
                  initialPosition.longitude! == "" ? "28.9743033" : initialPosition.longitude!)),
          selectedPlaceWidgetBuilder: (_, r, st, b) {
            onPlacePicked.call(Location(
                latitude: r?.geometry?.location.lat.toString() ?? "",
                longitude: r?.geometry?.location.lng.toString() ?? ""));
            return Container();
          },
        ),
      ),
    );
  }
}
