import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  Position _currentLocation = Position(
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0,
    latitude: 0.0,
    longitude: 0.0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );
  get currentLocation => _currentLocation;

  @override
  void onInit() {
    super.onInit();
    setCurrentLocation();
  }

  void setCurrentLocation() async {
    _currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
